require_relative '../spec_helper.rb'

describe Elevator do
  let(:building) { double('building') }
  let(:floor) { double('floor') }
  let(:other_floor) { double('other_floor') }
  let(:elevator) { Elevator.new(building, floor) }

  describe '#initialize' do
    it 'belongs to the building' do
      elevator.building.should == building
    end

    it 'has a starting floor' do
      elevator.current_floor.should == floor
    end
  end

  describe '#move' do
    let(:floor_number) { 3 }

    before(:each) do
      building.should_receive(:get_floor).with(floor_number).and_return(other_floor)
    end

    it 'changes the current floor' do
      elevator.current_floor.should == floor
      elevator.move(floor_number)
      elevator.current_floor.should == other_floor
    end

    it 'returns the new floor' do
      elevator.move(floor_number).should == other_floor
    end
  end
end
