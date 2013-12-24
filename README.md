# Bearclaws

Analyze the output of you AWS [cost allocation report](http://aws.amazon.com/about-aws/whats-new/2012/08/21/aws-billing-enables-cost-allocation-reports/). Group your costs by an arbitrary tag, like `client`.

## Installation

Add this line to your application's Gemfile:

    gem 'bearclaws'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bearclaws

## CLI Usage

**1)** Download your cost allocation report from AWS (e.g. `93795-aws-cost-allocation-2013-09.csv`)

**2)** Identify the zero-indexed column in the CSV by which you want to 'group' things. (e.g. `31`)

**3)** Run the analyzer

    $ bearclaws 93795-aws-cost-allocation-2013-09.csv 31

**4)** Examine the results in `bearclaws.csv`. It will look something like this:

<table>
  <tbody>
    <tr>
      <td><strong>client1</strong></td>
      <td></td>
    </tr>
    <tr>
      <td>AWSDataTransfer</td>
      <td>191.32</td>
    </tr>
    <tr>
      <td>AmazonEC2</td>
      <td>39.10</td>
    </tr>
    <tr>
      <td>AmazonS3</td>
      <td>170.29</td>
    </tr>
    <tr>
      <td>AmazonSNS</td>
      <td>0.00</td>
    </tr>
    <tr>
      <td>AmazonRDS</td>
      <td>173.07</td>
    </tr>
    <tr>
      <td>AmazonETS</td>
      <td>3.89</td>
    </tr>
    <tr>
      <td>AmazonRoute53</td>
      <td>1.01</td>
    </tr>
    <tr>
      <td><strong>Total</strong></td>
      <td><strong>578.68</strong></td>
    </tr>
    <tr><td></td><td></td></tr>
    <tr>
      <td><strong>client2</strong></td>
      <td></td>
    </tr>
    <tr>
      <td>AWSDataTransfer</td>
      <td>0.00</td>
    </tr>
    <tr>
      <td>AmazonEC2</td>
      <td>14.40</td>
    </tr>
    <tr>
      <td><strong>Total</strong></td>
      <td><strong>14.40</strong></td>
    </tr>
    <tr><td></td><td></td></tr>
    <tr>
      <td><strong>client3</strong></td>
      <td></td>
    </tr>
    <tr>
      <td>AWSDataTransfer</td>
      <td>0.01</td>
    </tr>
    <tr>
      <td>AmazonEC2</td>
      <td>14.40</td>
    </tr>
    <tr>
      <td><strong>Total</strong></td>
      <td><strong>14.41</strong></td>
    </tr>
  </tbody>
</table>


### CLI Options

`-o` The name of the CSV output file. Defaults to `bearclaws.csv`

## API Usage

    csv    = File.open '93795-aws-cost-allocation-2013-09.csv'
    groups = Bearclaws.analyze csv, 31

    groups.each do |group|
      puts group.name  # Name of the tag
      puts group.total # Total cost attributed to the tag
      group.subtotals.each do |key, subtotal|
        puts %{#{key} - #{subtotal}}
      end
    end

  Learn more in the [docs](#)

