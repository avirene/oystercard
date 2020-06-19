class Journeylog
  
  attr_reader :journeylog
  
  def initialize
    @journeylog = []
  end
  
  def start(station)
    @journeylog << Journey.new(station)
  end
  
  def finish(station)
    @journeylog.last.finish(station)
  end
  
  def journeys
    @journeylog
  end
  
end