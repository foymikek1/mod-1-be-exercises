class Dock
  attr_reader :name
  attr_accessor :max_rental_time, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    hash = {}
    if boat.hours_rented > @max_rental_time
      hash["amount"] = @max_rental_time * boat.price_per_hour
    else
      hash["amount"] = boat.hours_rented * boat.price_per_hour
    end
    hash["card_number"] = @rental_log[boat].credit_card_number
    hash
  end

  def return(boat)
    if boat.hours_rented > @max_rental_time
      boat.hours_logged += @max_rental_time
    else
      boat.hours_logged += boat.hours_rented
    end
    boat.hours_rented = 0
  end

  def log_hour
    @rental_log.keys.each do |boat|
      boat.hours_rented += 1
    end
  end

  def revenue
    revenue = 0
    @rental_log.keys.each do |boat|
      if boat.hours_rented > @max_rental_time
      revenue += (@max_rental_time * boat.price_per_hour)
      else
      revenue += (boat.hours_rented * boat.price_per_hour)
      end
      revenue += (boat.hours_logged * boat.price_per_hour)
    end
    revenue
  end
end