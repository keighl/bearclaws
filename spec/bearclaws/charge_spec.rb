require File.expand_path('../../spec_helper', __FILE__)

describe Bearclaws::Charge do

  describe 'attrs' do
    it "are decided by AWSMAP" do
      r = Bearclaws::Charge.new
      Bearclaws::AWSMAP.each do |k, v|
        expect(r).to respond_to k
      end
    end
  end

  describe 'constructor' do
    it "should attempt to hydrate all attrs by the AWSMAP" do
      charge = []
      Bearclaws::AWSMAP.each do |k, v|
        q = 'value'
        charge.should_receive(:[]).with(v).and_return q
        Bearclaws::Charge.any_instance.should_receive(:send).with("#{k}=", q)
      end
      Bearclaws::Charge.new charge
    end
  end
end