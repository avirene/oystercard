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
    @exit_station = station
    deduct(MINIMUM_FARE)
    @journeys << {@entry_station => @exit_station}
    @entry_station = nil
    @exit_station
  end
  
  private
  
  def deduct(amount)
    @balance -= amount
  end
  
end

# oystercard = Oystercard.new
# oystercard.top_up(5)
# oystercard.touch_in("Angel")
# oystercard.in_journey?
# p oystercard.in_journey?
