require "oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:station) { double :station }
  
  describe "initialize" do
    it "can create an instance of oystercard" do
      expect(oystercard).to be_an_instance_of(Oystercard)
    end
    it "should have the ability to store journeys in an Array" do
      expect(oystercard.journeys).to be_an_instance_of(Array)
    end
    it "journeys should be empty when creating a new oystercard" do
      expect(oystercard.journeys).to be_empty
    end
  end
    
  describe "#balance" do
    it "checks balance" do
      expect(oystercard.balance).to eq(0)
    end
  end
    
  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up the balance" do
      expect { oystercard.top_up(2) }.to change{ oystercard.balance }.by 2
    end
    
    it 'raises an error if the maximum balance is exceeded' do
      expect{ oystercard.top_up(Oystercard::MAXIMUM_BALANCE + 1) }.to raise_error "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} exceeded"
    end
  end
  
  describe "#touch_in" do
    it { is_expected.to respond_to(:touch_in).with(1).argument }
    
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
    
    it "raises an error if the balance is less than minimum fare" do
      expect { oystercard.touch_in(station) }.to raise_error("Not enough money to travel.")
    end
    
    context "card has money to start journey" do
    
      before do
        oystercard.top_up(1)
        oystercard.touch_in(station)
      end
      
      it "returns the station that we touched in at" do
        expect(oystercard.journeys.last.entry_station).to eq station
      end
      
      it "can touch in" do
        expect(oystercard).to be_in_journey
      end
    end
    
  end
  
  describe "#touch_out" do
    before do
      oystercard.top_up(1)
      oystercard.touch_in(station)
    end
    
    it "can touch out" do
      oystercard.touch_out(station)
      expect(oystercard).not_to be_in_journey
    end
    
    it "deducts balance by minimum fare" do
      expect { oystercard.touch_out(station) }.to change{ oystercard.balance }.by(- Oystercard::MINIMUM_FARE)
    end
    
    it "should respond to an exit station that is provided as an argument" do
      expect(oystercard).to respond_to(:touch_out).with(1).argument
    end
    
    it "should store the station passed in as argument into touch out" do
      oystercard.touch_out(station)
      expect(oystercard.journeys.last.exit_station).to eq(station)
    end
  
    it "should store journeys using entry and exit station of each trip" do
    oystercard.touch_out(station)
    expect(oystercard.journeys.length).to eq(1)
    end
  end
end
