require 'oystercard'
describe Oystercard do
    describe 'initialize' do
        it 'can create an instance of oystercard' do
            oystercard = Oystercard.new
            expect(oystercard).to be_an_instance_of(Oystercard)
        end
    end
    describe '#balance' do
      it 'checks balance' do
        oystercard = Oystercard.new
        expect(oystercard.balance).to eq(0)
      end
    end
end