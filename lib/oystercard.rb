class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys
  
  def initialize
    @balance = 0
    @journeys = []
  end
  
    
  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + @balance > MAXIMUM_BALANCE
     @balance += amount
  end
  
  def in_journey?
    !!@entry_station
  end
  
  def touch_in(station)
    fail "Not enough money to travel." if @balance < MINIMUM_FARE
    @entry_station = station
  end
  
  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @exit_station = station
    #hash = {@entry_station => @exit_station}
     journeys << {@entry_station => @exit_station}
  end
  
  private
  
  def deduct(amount)
    @balance -= amount
  end
  
end
