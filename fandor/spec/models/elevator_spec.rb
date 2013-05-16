require_relative '../spec_helper.rb'

describe Elevator do
  let(:building) { double('building') }
  let(:floor) { double('floor') }
  let(:elevator) { Elevator.new(building, floor) }

  describe '#initialize' do
    it 'belongs to the building' do
      elevator.building.should == building
    end

    it 'has a starting floor' do
      elevator.floor.should == floor
    end
  end
end
