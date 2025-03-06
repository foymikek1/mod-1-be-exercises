class Photograph
  attr_reader :id, :name, :artist_id, :year

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @artist_id = args[:artist_id]
    @year = args[:year]
  end
end