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