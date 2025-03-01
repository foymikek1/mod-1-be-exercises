require 'rspec'
require '../lib/player'
require '../lib/team'
require '../lib/world_cup'

describe Player do
  describe '#initialize' do
    it 'is a player' do
      player = Player.new({name: "Luka Modric", position: "midfielder"})
      
      expect(player).to be_a Player
    end

    it 'has a name' do
      player = Player.new({name: "Luka Modric", position: "midfielder"})
      
      expect(player.name).to eq "Luka Modric"
    end

    it 'has a position' do
      player = Player.new({name: "Luka Modric", position: "midfielder"})
      
      expect(player.position).to eq "midfielder"
    end

    it 'can have different name and position' do
     player = Player.new({name: "John Dutton", position: "forward"})
      
      expect(player.name).to eq "John Dutton"
      expect(player.position).to eq "forward"
    end
  end
end

describe Team do
  describe '#initialize' do
    it 'is a team' do
     team = Team.new("France") 

     expect(team).to be_a Team
    end

    it 'has a country' do
      team = Team.new("France") 

      expect(team.country).to eq "France"
    end

    it 'can be a different country' do
      team = Team.new("USA") 

      expect(team.country).to eq "USA"
    end

    it 'can be eliminated' do
      team = Team.new("France") 

      expect(team.eliminated?).to eq false

      team.eliminated = true
      expect(team.eliminated?).to eq true
    end

    it 'can have players' do
      team = Team.new("USA")
      
      expect(team.players).to eq []
    end

    it 'can add players' do
      team = Team.new("USA")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

      team.add_player(mbappe)
      team.add_player(pogba)

      roster = [mbappe, pogba]

      expect(team.players).to eq roster
    end

    it 'can return players by position' do
      team = Team.new("USA")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"})

      team.add_player(mbappe)
      team.add_player(pogba)

      expect(team.players_by_position("midfielder")).to eq [pogba]
      expect(team.players_by_position("forward")).to eq [mbappe]
    end
  end
end


describe WorldCup do
  describe '#initialize' do
    it 'is a World_cup' do
      france = Team.new("France")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
      france.add_player(mbappe) 
      france.add_player(pogba) 
      croatia = Team.new("Croatia") 
      modric = Player.new({name: "Luka Modric", position: "midfielder"})
      vida = Player.new({name: "Domagoj Vida", position: "defender"})
      croatia.add_player(modric) 
      croatia.add_player(vida)
      world_cup = WorldCup.new(2018, [france, croatia]) 

      expect(world_cup).to be_a WorldCup
    end

    it 'has a year' do
      france = Team.new("France")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
      france.add_player(mbappe) 
      france.add_player(pogba) 
      croatia = Team.new("Croatia") 
      modric = Player.new({name: "Luka Modric", position: "midfielder"})
      vida = Player.new({name: "Domagoj Vida", position: "defender"})
      croatia.add_player(modric) 
      croatia.add_player(vida)
      world_cup = WorldCup.new(2018, [france, croatia]) 

      expect(world_cup.year).to eq 2018
    end

    it 'has teams' do
      france = Team.new("France")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
      france.add_player(mbappe) 
      france.add_player(pogba) 
      croatia = Team.new("Croatia") 
      modric = Player.new({name: "Luka Modric", position: "midfielder"})
      vida = Player.new({name: "Domagoj Vida", position: "defender"})
      croatia.add_player(modric) 
      croatia.add_player(vida)
      world_cup = WorldCup.new(2018, [france, croatia]) 

      expect(world_cup.teams).to eq [france, croatia]
    end

    it 'can return active players by position' do
      france = Team.new("France")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
      france.add_player(mbappe) 
      france.add_player(pogba) 
      croatia = Team.new("Croatia") 
      modric = Player.new({name: "Luka Modric", position: "midfielder"})
      vida = Player.new({name: "Domagoj Vida", position: "defender"})
      croatia.add_player(modric) 
      croatia.add_player(vida)
      world_cup = WorldCup.new(2018, [france, croatia]) 

      expect(world_cup.active_players_by_position("midfielder")).to eq [pogba, modric]

      croatia.eliminated = true  
      expect(world_cup.active_players_by_position("midfielder")).to eq [pogba]
    end

    it 'can return all World Cup players by postion' do
      france = Team.new("France")
      mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
      pogba = Player.new({name: "Paul Pogba", position: "midfielder"}) 
      france.add_player(mbappe) 
      france.add_player(pogba) 
      croatia = Team.new("Croatia") 
      modric = Player.new({name: "Luka Modric", position: "midfielder"})
      vida = Player.new({name: "Domagoj Vida", position: "defender"})
      croatia.add_player(modric) 
      croatia.add_player(vida)
      world_cup = WorldCup.new(2018, [france, croatia]) 
      
      players_by_position = {"forward" => [mbappe],
                             "midfielder" => [pogba, modric],
                             "defender" => [vida]
                            }

      expect(world_cup.all_players_by_position).to eq players_by_position
    end
  end
end