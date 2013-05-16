require_relative '../spec_helper.rb'

describe Floor do
  let(:building) { double('building') }
  let(:elevator) { double('elevator') }

  describe '#initialize' do
    it 'assigns a floor number from argument' do
      Floor.new(building, 1).number.should == 1
      Floor.new(building, 100).number.should == 100
    end

    it 'belongs to a building' do
      Floor.new(building, 1).building.should == building
    end
  end

  describe '#call_elevator' do
    it 'returns an elevator from the building' do
      building.should_receive(:call_elevator).and_return(elevator)
      Floor.new(building, 1).call_elevator.should == elevator
    end
  end
end
