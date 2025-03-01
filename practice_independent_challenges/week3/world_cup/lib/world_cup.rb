class WorldCup
  attr_reader :year
  attr_accessor :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    players = @teams.map do |team|
      team.eliminated? == false ? team.players_by_position(position) : nil
    end.flatten
    players.delete(nil)
    players
  end

  def all_players_by_position
    hash = Hash.new 
    all_positions.each do |position|
         hash[position] = active_players_by_position(position)
    end
    hash
  end

  def all_positions
    all_positions = []
    @teams.each do |team|
      team.players.each do |player|
        all_positions << player.position
      end
    end   
    all_positions.uniq
  end

end