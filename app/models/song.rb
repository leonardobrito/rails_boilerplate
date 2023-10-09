require 'csv'

class Song < ApplicationRecord
  update_index("songs") { self }

  def self.import_csv!
    filepath = "tcc_ceds_music.csv"
    res = CSV.parse(File.read(filepath), headers: true)
    res.each_with_index do |s, ind|
      Song.create!(
        artist: s["artist_name"],
        title: s["track_name"],
        genre: s["genre"],
        lyrics: s["lyrics"]
      )
    end
  end
end
