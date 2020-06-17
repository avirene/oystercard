class Oystercard
  MAXIMUM_BALANCE = 90
  attr_reader :balance
  
  def initialize
    @balance = 0
    @location = false
  end
    
  def top_up(amount)
    fail 'Maximum balance of #{maximum_balance} exceeded' if amount + balance > MAXIMUM_BALANCE
     @balance += amount
  end
  
  def deduct(amount)
    @balance -= amount
  end
  
  def in_journey?
    @location
  end
  
  def touch_in
    @location = true
  end
  
  def touch_out
    @location = false
  end
  
end
