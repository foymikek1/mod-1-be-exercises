class Boat
  attr_reader :type
  attr_accessor :price_per_hour, :hours_rented, :hours_logged

  def initialize(type, price_per_hour)
    @type = type
    @price_per_hour = price_per_hour
    @hours_rented = 0
    @hours_logged = 0
  end

  def add_hour
    @hours_rented += 1
  end
end