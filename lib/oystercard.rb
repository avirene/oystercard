class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :journeys
  
  def initialize
    @balance = 0
    @journeys = []
    #@journeys = Journeylog.new
  end
  
    
  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + @balance > MAXIMUM_BALANCE
     @balance += amount
  end
  
  def in_journey?
    @journeys != [] ? !@journeys.last.complete? : false
  end
  
  def touch_in(station)
    fail "Not enough money to travel." if @balance < MINIMUM_FARE
    @journeys << Journey.new(station)
    #@journeys.start(station)
  end
  
  def touch_out(station)
    @journeys.last.finish(station)
    deduct(@journeys.last.fare)
  end
  
  private
  
  def deduct(amount)
    @balance -= amount
  end
  
end
