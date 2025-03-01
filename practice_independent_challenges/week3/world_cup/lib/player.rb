class Player
  attr_reader :name
  attr_accessor :position
  def initialize(args)
    @name = args[:name]
    @position = args[:position]
  end
end