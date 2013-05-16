class Elevator
  attr_reader :building
  attr_reader :current_floor

  def initialize(building, starting_floor)
    @building = building
    @current_floor = starting_floor
  end

  def move(floor_number)
    @current_floor = @building.get_floor(floor_number)
  end
end
