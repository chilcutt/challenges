require_relative '../spec_helper.rb'

describe Floor do
  describe '#initialize' do
    it 'assigns a floor number from argument' do
      Floor.new(1).number.should == 1
      Floor.new(100).number.should == 100
    end
  end
end
