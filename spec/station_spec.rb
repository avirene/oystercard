require 'station.rb'

describe Station do
  describe '#initialize' do
    it "creates a new instance of a station" do
      station = Station.new
      expect(station).to be_an_instance_of(Station)
    end

    it "returns the name of a station" do
      station = Station.new
      expect(station.name).to eq("Angel")
    end

    it "returns the zone of a station" do
      station = Station.new
      expect(station.zone).to eq(1)
    end
  end
end
