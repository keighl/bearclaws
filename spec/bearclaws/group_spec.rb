require File.expand_path('../../spec_helper', __FILE__)

describe Bearclaws::Group do


  describe "constructor" do

    it "should hydrate the name attr" do
      x = Bearclaws::Group.new 'cheese', []
      expect(x.name).to eq('cheese'.to_sym)
    end

    it "should hydrate the charges attr" do
      charges = []
      x = Bearclaws::Group.new 'cheese', charges
      expect(x.charges).to eq(charges)
    end
  end

  describe '#total' do

    it "should return the sum of all charge total_costs" do
      charges = []
      10.times do
        r = Bearclaws::Charge.new()
        r.total_cost = 10.00
        charges << r
      end
      x = Bearclaws::Group.new 'cheese', charges
      expect(x.total).to eq(100.00)
    end
  end

  describe '#subtotals' do

    it "should return the a hash of subtotals broken out by product_code" do
      charges = []
      5.times do |n|
        2.times do
          r              = Bearclaws::Charge.new()
          r.total_cost   = 10.00
          r.product_code = "product_#{n}"
          charges << r
        end
      end

      x = Bearclaws::Group.new 'cheese', charges

      expect(x.subtotals).to eq({
        "product_0" => 20.00,
        "product_1" => 20.00,
        "product_2" => 20.00,
        "product_3" => 20.00,
        "product_4" => 20.00
      })
    end
  end
end