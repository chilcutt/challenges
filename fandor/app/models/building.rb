class Building
  attr_reader :floors
  attr_reader :elevator

  def initialize(num_floors)
    @floors = []
    (1..num_floors).each do |f|
      @floors << Floor.new(f)
    end

    @elevator = Elevator.new(@floors.first)
  end
end
