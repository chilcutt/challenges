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

  it 'handles multiple users' do
    # user 1 enters the building and moves to the 5th floor
    user1_floor = building.enter
    user1_floor = user1_floor.call_elevator.move(5)

    # user 1 should be on the 5th floor
    user1_floor.should == building.get_floor(5)
    user1_floor.number.should == 5

    # elevator should be on 5th floor
    building.elevator.current_floor.should == user1_floor

    # user 2 enters the building and calls the elevator
    user2_floor = building.enter
    user2_floor.call_elevator

    # elevator should be on the first floor now
    building.elevator.current_floor.should == user2_floor
    building.elevator.current_floor.should_not == user1_floor

    # user 2 works on floor 2
    user2_floor = user2_floor.call_elevator.move(2)
    user2_floor.should == building.get_floor(2)
    user2_floor.number.should == 2
    building.elevator.current_floor.should == user2_floor
    building.elevator.current_floor.should_not == user1_floor

    # user 1 wants to leave now
    user1_floor.call_elevator
    building.elevator.current_floor.should == user1_floor
    building.elevator.current_floor.should_not == user2_floor

    # user 1 goes to the first floor
    user1_floor = user1_floor.call_elevator.move(1)
    user1_floor.should == building.get_floor(1)
    user1_floor.number.should == 1
    building.elevator.current_floor.should == user1_floor
    building.elevator.current_floor.should_not == user2_floor
  end

  it 'performs under stress' do
    current_floor = building.enter
    10000.times do
      elevator = current_floor.call_elevator
      target_floor = rand(5) + 1
      current_floor = elevator.move(target_floor)
      current_floor.number.should == target_floor
    end
  end
end
