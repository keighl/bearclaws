require File.expand_path('../spec_helper', __FILE__)
require 'csv'

describe Bearclaws do

  describe "#analyze" do

    context 'failures' do
      it "raises when no CSV path is supplied" do
        expect(lambda {
          Bearclaws.analyze nil
        }).to raise_error
      end

      it "raises when no group column is supplied" do
        expect(lambda {
          Bearclaws.analyze File.open('spec/support/input.csv')
        }).to raise_error
      end

      it "raises when group column is not an integer" do
        expect(lambda {
          Bearclaws.analyze File.open('spec/support/input.csv'), 'cheese'
        }).to raise_error
      end
    end

    context 'success' do

      it "shoup pop and shift the input csv a couple times" do
        rows = []
        CSV.should_receive(:parse).and_return rows
        rows.should_receive(:shift).with(2).and_return rows
        rows.should_receive(:pop).with(3).and_return rows
        Bearclaws.analyze File.open('spec/support/input.csv'), 30
      end

      it "parses the file and returns an array of Bearclaws::Groups" do
        x = Bearclaws.analyze File.open('spec/support/input.csv'), 30
        expect(x).to be_a Array
      end

      it "each group should contain some charges" do
        x = Bearclaws.analyze File.open('spec/support/input.csv'), 30
        x.each { |y|
          expect(y.charges).to_not be_empty
        }
      end

      it "each group should have a unique name" do
        x     = Bearclaws.analyze File.open('spec/support/input.csv'), 30
        names = []
        x.each { |y|
          names << y.name unless names.include?(y.name)
        }
        expect(x.count).to eq(names.count)
      end

      it "one of the group should be 'default'" do
        x = Bearclaws.analyze File.open('spec/support/input.csv'), 30
        yep = 0
        x.each { |y|
          if y.name == :default
            yep += 1
          end
        }
        expect(yep).to eq(1)
      end
    end
  end
end