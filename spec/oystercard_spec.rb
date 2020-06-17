require "oystercard"
describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:station) { double :station }
  
  describe "initialize" do
    it "can create an instance of oystercard" do
      expect(oystercard).to be_an_instance_of(Oystercard)
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
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      oystercard.top_up(maximum_balance)
      expect{ oystercard.top_up(maximum_balance + 1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end
  
  describe "#touch_in" do
    it { is_expected.to respond_to(:touch_in).with(1).argument }
    
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
    
    it "returns the station that we touched in at" do
      oystercard.top_up(1)
      oystercard.touch_in(station)
      expect(oystercard.entry_station).to eq station
    end
    
    it "can touch in" do
      oystercard.top_up(1)
      oystercard.touch_in(station)
      expect(oystercard).to be_in_journey
    end
    
    it "raises an error if the balance is less than minimum fare" do
      expect { oystercard.touch_in(station) }.to raise_error("Not enough money to travel.")
    end
    
  end
  
  describe "#touch_out" do
    it "can touch out" do
      subject.top_up(1)
      subject.touch_in(station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
    
    it "should forget the entry station from touch in" do
      oystercard.top_up(1)
      oystercard.touch_in(station)
      oystercard.touch_out
      expect(oystercard.entry_station).to be nil
    end
    
    it "deducts balance by minimum fare" do
      oystercard.top_up(20)
      expect { oystercard.touch_out }.to change{ oystercard.balance }.by(- Oystercard::MINIMUM_FARE)
    end
  end
end
