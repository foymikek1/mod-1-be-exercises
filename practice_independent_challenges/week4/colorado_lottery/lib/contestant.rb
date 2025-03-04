class Contestant
  attr_reader :first_name, :last_name
  attr_accessor :age, :state_of_residence, :spending_money, :game_interests
  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @age = args[:age] 
    @state_of_residence = args[:state_of_residence]
    @spending_money = args[:spending_money]
    @game_interests = []
  end

  def full_name
    @first_name + " " + @last_name
  end

  def out_of_state?
    if @state_of_residence == "CO"
      false
    else
      true
    end
  end

  def add_game_interest(game)
    @game_interests << game
  end
end