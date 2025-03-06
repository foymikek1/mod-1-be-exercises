require '../lib/photograph'
require '../lib/artist'
require '../lib/curator'

describe 'Photograph' do
  describe '#initialize' do
    it 'is a photograph' do
      attributes = {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "4",
        year: "1954"
      }
      photograph = Photograph.new(attributes)
      expect(photograph).to be_a Photograph
    end

    it 'has an id' do
      attributes = {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "4",
        year: "1954"
      }
      photograph = Photograph.new(attributes)
      expect(photograph.id).to eq "1"
    end

    it 'has a name' do
      attributes = {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "4",
        year: "1954"
      }
      photograph = Photograph.new(attributes)
      expect(photograph.name).to eq "Rue Mouffetard, Paris (Boy with Bottles)"
    end

    it 'has an artist_id' do
      attributes = {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "4",
        year: "1954"
      }
      photograph = Photograph.new(attributes)
      expect(photograph.artist_id).to eq "4"
    end

    it 'has a year' do
      attributes = {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "4",
        year: "1954"
      }
      photograph = Photograph.new(attributes)
      expect(photograph.year).to eq "1954"
    end
  end
end

describe "Artist" do
  describe "#initialize" do
    it 'is an artist' do
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      expect(artist).to be_a Artist
    end

    it 'has an id' do
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      expect(artist.id).to eq "2"
    end

    it 'has a name' do
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      expect(artist.name).to eq "Ansel Adams"
    end

    it 'has a birth year' do
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      expect(artist.born).to eq "1902"
    end

    it 'has a death year' do
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      expect(artist.died).to eq "1984"
    end

    it 'has a country' do
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      expect(artist.country).to eq "United States"
    end

    it 'can return age at death' do
      attributes = {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      }
      artist = Artist.new(attributes)
      expect(artist.age_at_death).to eq 82
    end
  end
end

describe "Curator" do
  describe "#initialize" do
    it 'is a curator' do
      curator = Curator.new  
      expect(curator).to be_a Curator
    end

    it 'has photographs' do
      curator = Curator.new
      expect(curator.photographs).to eq []
    end

    it 'can add photographs' do
      curator = Curator.new
      photo_1 = Photograph.new({
       id: "1",      
       name: "Rue Mouffetard, Paris (Boy with Bottles)",
       artist_id: "1",
       year: "1954"
        })
      photo_2 = Photograph.new({
       id: "2",      
       name: "Moonrise, Hernandez",
       artist_id: "2",
       year: "1941"
        })
      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)
      expect(curator.photographs).to eq [photo_1, photo_2]
    end

    it 'can add artists' do
      curator = Curator.new
      artist_1 = Artist.new({
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
      })

      artist_2 = Artist.new({
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
      })
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      expect(curator.artists).to eq [artist_1, artist_2]
    end

    it 'can find artist by id' do
      curator = Curator.new
      artist_1 = Artist.new({
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
      })

      artist_2 = Artist.new({
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
      })
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      expect(curator.find_artist_by_id("1")).to eq artist_1
    end

    it 'can return a list of all artists and their photographs' do      curator = Curator.new
      curator = Curator.new
      artist_1 = Artist.new({
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
        })
      artist_2 = Artist.new({
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
        })
      artist_3 = Artist.new({
      id: "3",
      name: "Anna Andre",
      born: "1901",
      died: "1994",
      country: "United States"
        })
      photo_1 = Photograph.new({
       id: "1",      
       name: "Rue Mouffetard, Paris (Boy with Bottles)",
       artist_id: "1",
       year: "1954"
        })
      photo_2 = Photograph.new({
       id: "2",      
       name: "Moonrise, Hernandez",
       artist_id: "2",
       year: "1941"
        })
      photo_3 = Photograph.new({
       id: "3",      
       name: "Howling at the Moon",
       artist_id: "3",
       year: "1941"
        })
      photo_4 = Photograph.new({
       id: "4",      
       name: "Cyote chewing on a cigarette",
       artist_id: "3",
       year: "1949"
        })
      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)
      curator.add_photograph(photo_3)
      curator.add_photograph(photo_4)
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      curator.add_artist(artist_3)

      list = {
        artist_1 => [photo_1],
        artist_2 => [photo_2],
        artist_3 => [photo_3, photo_4]
      }
      expect(curator.artists_and_photos).to eq list
    end

    it 'can return a list of all artists and their photographs' do      curator = Curator.new
      curator = Curator.new
      artist_1 = Artist.new({
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
        })
      artist_2 = Artist.new({
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
        })
      artist_3 = Artist.new({
      id: "3",
      name: "Anna Andre",
      born: "1901",
      died: "1994",
      country: "United States"
        })
      photo_1 = Photograph.new({
       id: "1",      
       name: "Rue Mouffetard, Paris (Boy with Bottles)",
       artist_id: "1",
       year: "1954"
        })
      photo_2 = Photograph.new({
       id: "2",      
       name: "Moonrise, Hernandez",
       artist_id: "2",
       year: "1941"
        })
      photo_3 = Photograph.new({
       id: "3",      
       name: "Howling at the Moon",
       artist_id: "3",
       year: "1941"
        })
      photo_4 = Photograph.new({
       id: "4",      
       name: "Cyote chewing on a cigarette",
       artist_id: "3",
       year: "1949"
        })
      photo_5 = Photograph.new({
       id: "5",      
       name: "Sad Songs and Cowboys",
       artist_id: "1",
       year: "1923"
        })
      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)
      curator.add_photograph(photo_3)
      curator.add_photograph(photo_4)
      curator.add_photograph(photo_5)
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      curator.add_artist(artist_3)

      list = [artist_1.name, artist_3.name]
      expect(curator.artists_multiple_photographs).to eq list
    end

    it 'can return photos by nationality and artist' do
      curator = Curator.new
      artist_1 = Artist.new({
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
        })
      artist_2 = Artist.new({
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
        })
      artist_3 = Artist.new({
      id: "3",
      name: "Anna Andre",
      born: "1901",
      died: "1994",
      country: "United States"
        })
      photo_1 = Photograph.new({
       id: "1",      
       name: "Rue Mouffetard, Paris (Boy with Bottles)",
       artist_id: "1",
       year: "1954"
        })
      photo_2 = Photograph.new({
       id: "2",      
       name: "Moonrise, Hernandez",
       artist_id: "2",
       year: "1941"
        })
      photo_3 = Photograph.new({
       id: "3",      
       name: "Howling at the Moon",
       artist_id: "3",
       year: "1941"
        })
      photo_4 = Photograph.new({
       id: "4",      
       name: "Cyote chewing on a cigarette",
       artist_id: "3",
       year: "1949"
        })
      curator.add_photograph(photo_1)
      curator.add_photograph(photo_2)
      curator.add_photograph(photo_3)
      curator.add_photograph(photo_4)
      curator.add_artist(artist_1)
      curator.add_artist(artist_2)
      curator.add_artist(artist_3)

      condition_1 = curator.photos_by_name_and_country(artist_1.name, artist_1.country)
      expect(condition_1).to eq [photo_1]

      condition_2 = curator.photos_by_name_and_country(artist_3.name, artist_3.country)
      expect(condition_2).to eq [photo_3, photo_4]

      condition_3 = curator.photos_by_name_and_country(artist_1.name, artist_3.country)
      expect(condition_3).to eq nil
    end
  end
end