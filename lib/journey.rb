class Journey
  PENALTY_FARE = 6
  MINIMUM_FARE = 1
  attr_reader :entry_station, :exit_station, :entry_zone, :exit_zone
  
  def initialize(entry_station = "Default Entry Station", entry_zone = 0)
    @entry_station = entry_station
    @entry_zone = entry_zone
    @exit_station = "Default Exit Station"
  end
  
  def complete?
    @entry_station != "Default Entry Station" && @exit_station != "Default Exit Station"
  end
  
  def finish(station, exit_zone = 0)
    @exit_station = station
    @exit_zone = exit_zone
    self
  end
  
  def fare
    if complete?
      MINIMUM_FARE
    else
      PENALTY_FARE
    end
  end

end