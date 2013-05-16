require_relative '../spec_helper.rb'

describe Floor do
  let(:building) { double('building') }

  describe '#initialize' do
    it 'assigns a floor number from argument' do
      Floor.new(building, 1).number.should == 1
      Floor.new(building, 100).number.should == 100
    end

    it 'belongs to a building' do
      Floor.new(building, 1).building.should == building
    end
  end
end
