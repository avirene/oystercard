require "oystercard"
describe Oystercard do
  let(:oystercard) { Oystercard.new }
  
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
      expect{ oystercard.top_up(maximum_balance + 1) }.to raise_error 'Maximum balance of #{maximum_balance} exceeded'
    end
  end
  
  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }
  
    it 'deducts an amount from the balance' do
      oystercard.top_up(20)
      expect { oystercard.deduct(3) }.to change{ oystercard.balance }.by(-3)
    end
  end
  
  describe "#touch_in" do
    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
    
    it "can touch in" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end
  
  describe "#touch_out" do
    it "can touch out" do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
