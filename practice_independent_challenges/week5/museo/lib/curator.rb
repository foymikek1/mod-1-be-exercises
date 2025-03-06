class Curator
  attr_accessor :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def artists_and_photos
    catalog = Hash.new {|h, k| h[k] = []}
    @artists.each do |artist|
      @photographs.each do |photo|
        if artist.id == photo.artist_id
          catalog[artist] << photo
        end
      end
    end
    catalog
  end

  def artists_multiple_photographs
    list = artists_and_photos
    names = []
    list.each do |artist, photos|
      if photos.length > 1
        names << artist.name
      end
    end
    names
  end

  def photos_by_name_and_country(name, country)
    photos_list = nil
    artists_and_photos.each do |artist, photos|
      if artist.name == name && artist.country == country
        photos_list = photos
      end
    end
    photos_list
  end

end