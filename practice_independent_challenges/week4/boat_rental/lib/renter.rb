class Renter
  attr_reader :name
  attr_accessor :credit_card_number

  def initialize(name, credit_card_number)
    @name = name
    @credit_card_number = credit_card_number
  end
end