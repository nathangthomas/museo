class Curator
  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    @photographs << Photograph.new(photo)
  end

  def add_artist(artist)
    @artists << Artist.new(artist)
  end

  def find_artist_by_id(id)
    @artists.find{|artist| artist.id == id}
  end

  def find_photograph_by_id(id)
    @photographs.find{|photo| photo.id == id}
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end
  #
  # def artists_with_multiple_photographs
  #
  #   @artists.each do |artist|
  #   artist_ids = find_artist_by_id(artist.id)
  #     artist_ids.eacg do |id|
  #       binding.pry
  #       find_photograph_by_id(id)
  #
  #     end
  #   end
  # end


end

#* `artists_with_multiple_photographs` - This method returns an Array of all `Artist`s who have more than one photograph

#
# pry(main)> curator.photographs_taken_by_artist_from("United States")
# #=> [#<Photograph:0x00007fa3c286b088...>, #<Photograph:0x00007fa3c13a4050...>, #<Photograph:0x00007fa3c110e4a8...>]
#
# pry(main)> curator.photographs_taken_by_artist_from("Argentina")
# #=> []
# ```
