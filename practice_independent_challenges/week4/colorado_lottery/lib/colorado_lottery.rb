class ColoradoLottery
  attr_accessor :registered_contestants, :winners, :current_contestants

  def initialize
    @registered_contestants = Hash.new{|h, k| h[k] = []}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    any = contestant.game_interests.any? {|interest| interest == game.name }
    if contestant.age > 17 && any
      true
    else
      false
    end
  end

  def can_register?(contestant, game)
    game_condition = contestant.out_of_state? == false || game.national_drawing?
    interested_and_18?(contestant, game) && game_condition ? true : false
  end

  def register_contestant(contestant, game)
    condition_2 = contestant.spending_money >= game.cost
    if can_register?(contestant, game) && condition_2
      contestant.spending_money -= game.cost
      @registered_contestants[game] << contestant
    end
    contestant
  end

  def eligible_contestants(given_game)
    cash_eligible = []
    @registered_contestants.each do |game, contestants|
      if given_game == game 
        contestants.each do |contestant|
          if contestant.spending_money >= given_game.cost
            cash_eligible << contestant
          end
        end       
      end
    end
    cash_eligible
  end

end