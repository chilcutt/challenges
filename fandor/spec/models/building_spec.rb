require_relative '../spec_helper'

describe Building do
  describe '#initialize' do
    let(:elevator) { double('elevator') }

    before(:each) do
      Floor.stub(:new => double('floor'))
      Elevator.stub(:new => elevator)
    end

    it 'creates a building with the number of floors from arguments' do
      Building.new(5).floors.size.should == 5
    end

    it 'creates a building with a single elevator' do
      Building.new(1).elevator.should == elevator
    end
  end
end
