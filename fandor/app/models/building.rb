class Building
  attr_reader :floors
  attr_reader :elevator

  def initialize(num_floors)
    @floors = []
    (1..num_floors).each do |f|
      @floors << Floor.new(self, f)
    end

    @elevator = Elevator.new(@floors.first)
  end

  def enter
    @floors.first
  end

  def call_elevator(floor)
    elevator.move(floor)
    elevator
  end
end
