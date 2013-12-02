require File.expand_path('../../spec_helper', __FILE__)

describe Bearclaws::Group do


  describe "constructor" do

    it "should hydrate the name attr" do
      x = Bearclaws::Group.new 'cheese', []
      x.name.should eq('cheese'.to_sym)
    end

    it "should hydrate the records attr" do
      records = []
      x = Bearclaws::Group.new 'cheese', records
      x.records.should eq(records)
    end
  end

  describe '#total' do

    it "should return the sum of all record total_costs" do
      records = []
      10.times do
        r = Bearclaws::Record.new()
        r.total_cost = 10.00
        records << r
      end
      x = Bearclaws::Group.new 'cheese', records
      x.total.should eq(100.00)
    end
  end

  describe '#subtotals' do

    it "should return the a hash of subtotals broken out by product_code" do
      records = []
      5.times do |n|
        2.times do
          r              = Bearclaws::Record.new()
          r.total_cost   = 10.00
          r.product_code = "product_#{n}"
          records << r
        end
      end

      x = Bearclaws::Group.new 'cheese', records

      x.subtotals.should eq({
        "product_0" => 20.00,
        "product_1" => 20.00,
        "product_2" => 20.00,
        "product_3" => 20.00,
        "product_4" => 20.00
      })
    end
  end
end