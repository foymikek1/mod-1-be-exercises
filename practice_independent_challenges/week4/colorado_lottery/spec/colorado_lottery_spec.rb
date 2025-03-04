require '../lib/contestant'
require '../lib/game'
require '../lib/colorado_lottery'

describe 'Game' do
  describe '#initialize' do
    it 'is a Game' do
      pick_4 = Game.new('Pick 4', 2)
      expect(pick_4).to be_a Game
    end

    it 'has a name' do
      mega_millions = Game.new('Mega Millions', 5, true)
      expect(mega_millions.name).to eq "Mega Millions"
    end

    it 'has a cost' do
      mega_millions = Game.new('Mega Millions', 5, true)
      expect(mega_millions.cost).to eq 5
    end

    it 'can determine national drawing' do
      mega_millions = Game.new('Mega Millions', 5, true)
      expect(mega_millions.national_drawing?).to eq true

      pick_4 = Game.new('Pick 4', 2)
      expect(pick_4.national_drawing?).to eq false
    end
  end
end

describe 'Contestant' do
  describe '#initialize' do
    it 'is a Contestant' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})      
      expect(alexander).to be_a Contestant
    end

    it 'has a name' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})   
      expect(alexander.full_name).to eq "Alexander Aigiades"
    end

    it 'has an age' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})   
      expect(alexander.age).to eq 28
    end

    it 'has a state of residence' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})   
      expect(alexander.state_of_residence).to eq "CO"
    end

    it 'has spending money' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})   
      expect(alexander.spending_money).to eq 10
    end

    it 'can determine out of state residence' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})   
      expect(alexander.out_of_state?).to eq false
    end
    
    it 'has game interests' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})   
      expect(alexander.game_interests).to eq []
    end

    it 'can add game interests' do
      alexander = Contestant.new({first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})   
      pick_4 = Game.new('Pick 4', 2)
      mega_millions = Game.new('Mega Millions', 5, true)
      alexander.add_game_interest('Mega Millions')
      alexander.add_game_interest('Pick 4')

      expect(alexander.game_interests).to eq ["Mega Millions", "Pick 4"]
    end
  end
end

describe "ColoradoLottery" do
  describe "#initialize" do
    it 'is a ColoradoLottery' do
      lottery = ColoradoLottery.new
      expect(lottery).to be_a ColoradoLottery
    end

    it 'has registered contestants' do
      lottery = ColoradoLottery.new
      expect(lottery.registered_contestants).to be_a Hash
    end

    it 'has winners' do
      lottery = ColoradoLottery.new
      expect(lottery.winners).to eq []
    end

    it 'has current contestants' do
      lottery = ColoradoLottery.new
      expect(lottery.current_contestants).to be_a Hash
    end

    it 'determines contestants age and game interest' do
      lottery = ColoradoLottery.new
      pick_4 = Game.new('Pick 4', 2)
      mega_millions = Game.new('Mega Millions', 5, true)
      cash_5 = Game.new('Cash 5', 1)
      alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
      benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
      frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
      winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
      alexander.add_game_interest('Pick 4')
      alexander.add_game_interest('Mega Millions')
      frederick.add_game_interest('Mega Millions')
      winston.add_game_interest('Cash 5')
      winston.add_game_interest('Mega Millions')
      benjamin.add_game_interest('Mega Millions')

      expect(lottery.interested_and_18?(alexander, pick_4)).to eq true
      expect(lottery.interested_and_18?(benjamin, mega_millions)).to eq false
      expect(lottery.interested_and_18?(alexander, cash_5)).to eq false
    end

    it 'determines if contestants can register for a game' do
      lottery = ColoradoLottery.new
      pick_4 = Game.new('Pick 4', 2)
      mega_millions = Game.new('Mega Millions', 5, true)
      cash_5 = Game.new('Cash 5', 1)
      alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
      benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
      frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
      winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
      alexander.add_game_interest('Pick 4')
      alexander.add_game_interest('Mega Millions')
      frederick.add_game_interest('Mega Millions')
      winston.add_game_interest('Cash 5')
      winston.add_game_interest('Mega Millions')
      benjamin.add_game_interest('Mega Millions')

      expect(lottery.can_register?(alexander, pick_4)).to eq true
      expect(lottery.can_register?(alexander, cash_5)).to eq false
      expect(lottery.can_register?(frederick, mega_millions)).to eq true
      expect(lottery.can_register?(benjamin, mega_millions)).to eq false
      expect(lottery.can_register?(frederick, cash_5)).to eq false
    end

    it 'can register contestants' do
      lottery = ColoradoLottery.new
      pick_4 = Game.new('Pick 4', 2)
      mega_millions = Game.new('Mega Millions', 5, true)
      cash_5 = Game.new('Cash 5', 1)
      alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
      benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
      frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'NY',
                       spending_money: 20})
      winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
      alexander.add_game_interest('Pick 4')
      alexander.add_game_interest('Mega Millions')
      frederick.add_game_interest('Mega Millions')
      winston.add_game_interest('Cash 5')
      winston.add_game_interest('Mega Millions')
      benjamin.add_game_interest('Mega Millions')     

      expect(lottery.registered_contestants.empty?).to eq true
      
      expect(lottery.register_contestant(alexander, pick_4)).to eq alexander
  
      lottery.register_contestant(frederick, mega_millions)

      lotter_registered_contestants = {
        mega_millions => [frederick],
        pick_4 => [alexander]
      }
      expect(lottery.registered_contestants).to eq lotter_registered_contestants
      
    end

    it 'can list elible contestants' do
      lottery = ColoradoLottery.new
      pick_4 = Game.new('Pick 4', 10)
      mega_millions = Game.new('Mega Millions', 5, true)
      cash_5 = Game.new('Cash 5', 1)
      alexander = Contestant.new({
                       first_name: 'Alexander',
                       last_name: 'Aigades',
                       age: 28,
                       state_of_residence: 'CO',
                       spending_money: 10})
      benjamin = Contestant.new({
                       first_name: 'Benjamin',
                       last_name: 'Franklin',
                       age: 17,
                       state_of_residence: 'PA',
                       spending_money: 100})
      frederick = Contestant.new({
                       first_name:  'Frederick',
                       last_name: 'Douglass',
                       age: 55,
                       state_of_residence: 'CO',
                       spending_money: 50})
      winston = Contestant.new({
                     first_name: 'Winston',
                     last_name: 'Churchill',
                     age: 18,
                     state_of_residence: 'CO',
                     spending_money: 5})
      alexander.add_game_interest('Pick 4')
      alexander.add_game_interest('Mega Millions')
      frederick.add_game_interest('Mega Millions')
      frederick.add_game_interest('Pick 4')
      winston.add_game_interest('Cash 5')
      winston.add_game_interest('Pick 4')
      benjamin.add_game_interest('Mega Millions')     
      
      lottery.register_contestant(alexander, pick_4)
      
      lottery.register_contestant(winston, pick_4)
      lottery.register_contestant(frederick, pick_4)
      lottery.register_contestant(alexander, mega_millions)
      lottery.register_contestant(frederick, mega_millions)

      expect(lottery.eligible_contestants(pick_4)).to eq [frederick]
      expect(lottery.eligible_contestants(mega_millions)).to eq [frederick]
    end
  end
end