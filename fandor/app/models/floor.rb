class Floor
  attr_reader :building
  attr_reader :number

  def initialize(building, floor_number)
    @building = building
    @number = floor_number
  end

  def call_elevator
    building.call_elevator
  end
end
