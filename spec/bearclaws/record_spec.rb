require File.expand_path('../../spec_helper', __FILE__)

describe Bearclaws::Record do

  describe 'attrs' do
    it "are decided by AWSMAP" do
      r = Bearclaws::Record.new
      Bearclaws::AWSMAP.each do |k, v|
        r.should respond_to k
      end
    end
  end

  describe 'constructor' do
    it "should attempt to hydrate all attrs by the AWSMAP" do
      record = []
      Bearclaws::AWSMAP.each do |k, v|
        q = 'value'
        record.should_receive(:[]).with(v).and_return q
        Bearclaws::Record.any_instance.should_receive(:send).with("#{k}=", q)
      end
      Bearclaws::Record.new record
    end
  end
end