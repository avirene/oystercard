require "journey.rb"

describe Journey do

  describe "initialize" do
    it "creates an instance of a journey" do
      journey = Journey.new
      expect(journey).to be_an_instance_of(Journey)
    end
  end
 
end  