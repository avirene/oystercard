require 'oystercard'
describe Oystercard do
  let(:oystercard) { Oystercard.new }
  
  describe 'initialize' do
    it 'can create an instance of oystercard' do
      expect(oystercard).to be_an_instance_of(Oystercard)
    end
  end
    
  describe '#balance' do
    it 'checks balance' do
      expect(oystercard.balance).to eq(0)
    end
  end
    
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end
  end
    
end
