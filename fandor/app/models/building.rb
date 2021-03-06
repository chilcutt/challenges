class Building
  attr_reader :floors
  attr_reader :elevator

  def initialize(num_floors)
    @floors = []
    (1..num_floors).each do |f|
      @floors << Floor.new(self, f)
    end

    @elevator = Elevator.new(self, @floors.first)
  end

  def enter
    @floors.first
  end

  def call_elevator(floor)
    elevator.move(floor.number)
    elevator
  end

  def get_floor(floor_number)
    @floors[floor_number - 1]
  end
end
