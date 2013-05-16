require_relative 'spec_helper'

describe 'integration tests' do
  let!(:building) { Building.new(5) }

  it 'allows the user to move up and down the building' do
    # enter the building, make sure we get a Floor object
    current_floor = building.enter
    current_floor.should be_instance_of(Floor)
    current_floor.number.should == 1

    # call the elevator and make sure we get an Elevator object
    elevator = current_floor.call_elevator
    elevator.should be_instance_of(Elevator)

    # move us to the next floor, we should get back the second floor
    current_floor = elevator.move(2)
    current_floor.should be_instance_of(Floor)
    current_floor.number.should == 2

    # move us back to the first floor
    current_floor.call_elevator.move(1).number.should == 1
  end
end
