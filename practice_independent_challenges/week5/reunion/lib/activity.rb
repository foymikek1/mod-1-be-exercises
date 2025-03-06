class Activity
  attr_reader :name
  attr_accessor :participants, :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, cost)
    @participants[name] = cost
    @participants
  end

  def total_cost
    @total_cost = 0
    @participants.each do |participant, cost|
      @total_cost += cost
    end
    @total_cost
  end

  def split
    total_cost / (@participants.keys.length)
  end

  def owed
    list = {}
    @participants.each do |participant, cost|
      list[participant] = split - cost
    end    
    list
  end
end