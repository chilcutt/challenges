require_relative '../spec_helper'

describe Building do
  let(:building) { Building.new(5) }
  let(:elevator) { double('elevator') }
  let(:first_floor) { double('first_floor') }
  let(:other_floor) { double('other_floor', :number => 3) }

  before(:each) do
    Floor.stub(:new).and_return(first_floor, other_floor)
    Elevator.stub(:new => elevator)
  end

  describe '#initialize' do
    it 'creates a building with the number of floors from arguments' do
      building.floors.size.should == 5
    end

    it 'creates a building with a single elevator' do
      building.elevator.should == elevator
    end
  end

  describe '#enter' do
    it 'returns the first floor' do
      building.enter.should == first_floor
    end
  end

  describe '#call_elevator' do
    before(:each) do
      elevator.stub(:move)
    end

    it 'moves the elevator to the calling floor' do
      elevator.should_receive(:move).with(other_floor.number)
      building.call_elevator(other_floor)
    end

    it 'returns the elevator' do
      building.call_elevator(other_floor).should == elevator
    end
  end

  describe '#get_floor' do
    it 'returns the floor at the given number' do
      building.get_floor(1).should == first_floor
      building.get_floor(2).should == other_floor
    end
  end
end
