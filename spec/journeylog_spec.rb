require "journeylog.rb"

describe Journeylog do
  
  let(:station) { double :station, zone: 1}

    describe '#initialize' do
      it 'initializes an instance of Journeylog class' do
        expect(subject).to be_an_instance_of(Journeylog)
      end
      it 'initializes with an empty journeylog array' do
        expect(subject.journeylog). to eq([])
      end
    end 
    
    describe '#start' do
      it { is_expected.to respond_to(:start).with(1).argument }
      
      it 'should start a new journey with an entry station' do
        subject.start(station)
        expect(subject.journeylog.last.entry_station).to eq(station)
      end
    end 
    
    describe '#finish' do
      it '' do
      #  expect(subject).
      end
    end 
    
    describe '#journeys' do
      it 'should return a read only list of journeys' do
        subject.start(station)
        subject.finish(station)
        expect(subject.journeys).to eq("[#<Journey:0x0000000002614e08 @entry_station=#<Double :station>, @entry_zone=0, @exit_station=#<Double :station>, @exit_zone=0>]")
      end
    end 
  
  
end