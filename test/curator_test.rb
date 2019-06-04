require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'pry'

class CuratorTest < MiniTest::Test
  def setup
    @curator = Curator.new

    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }

    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    @photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }

    @photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }

    @artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }

    @artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    @artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }

  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_it_has_no_artists
    assert_equal [], @curator.artists
  end

  def test_it_has_no_photographs
    assert_equal [], @curator.photographs
  end

  def test_it_can_add_photographs
    p1 = @curator.add_photograph(@photo_1).last
    p2 = @curator.add_photograph(@photo_2).last

    assert_equal [p1, p2], @curator.photographs

    assert_equal p1, @curator.photographs.first

    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @curator.photographs.first.name

  end

  def test_it_can_add_artists
    a1 = @curator.add_artist(@artist_1).last
    a2 = @curator.add_artist(@artist_2).last

    assert_equal [a1, a2], @curator.artists

    assert_equal a1, @curator.artists.first

    assert_equal "Henri Cartier-Bresson", @curator.artists.first.name
  end

  def test_find_artist_by_id
    a1 = @curator.add_artist(@artist_1).last
    a2 = @curator.add_artist(@artist_2).last

    assert_equal a1, @curator.find_artist_by_id("1")
  end

  def test_find_photograph_by_id
  p1 = @curator.add_photograph(@photo_1).last
  p2 = @curator.add_photograph(@photo_2).last

    assert_equal p2, @curator.find_photograph_by_id("2")
   end

  def test_it_can_find_photogpraphs_by_id
    p1 = @curator.add_photograph(@photo_1).last
    p2 = @curator.add_photograph(@photo_2).last
    p3 = @curator.add_photograph(@photo_3).last
    p4 =@curator.add_photograph(@photo_4).last
    a1 = @curator.add_artist(@artist_1).last
    a2 = @curator.add_artist(@artist_2).last
    a3 = @curator.add_artist(@artist_3).last

    assert_equal a3, @curator.find_artist_by_id("3")
    assert_equal [p3, p4], @curator.find_photographs_by_artist(a3)
  end

  # def test_artists_with_multiple_photopraphs
  #   p1 = @curator.add_photograph(@photo_1).last
  #   p2 = @curator.add_photograph(@photo_2).last
  #   p3 = @curator.add_photograph(@photo_3).last
  #   p4 =@curator.add_photograph(@photo_4).last
  #   a1 = @curator.add_artist(@artist_1).last
  #   a2 = @curator.add_artist(@artist_2).last
  #   a3 = @curator.add_artist(@artist_3).last
  #
  #   assert_equal [p3], @curator.artists_with_multiple_photographs
  #   # assert_equal 1, @curator.artists_with_multiple_photographs.length
  #   # assert @curator.artists_with_multiple_photographs.first
  # end
end
