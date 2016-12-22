require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_board'

class GameBoardTest < Minitest::Test

  def test_ai_coordinates_produces_correct_coordinates
    g = GameBoard.new
    g.ai_place_first_coordinate_of_two_space_ship
    assert_equal ["a1", "a2", "a3", "a4", "b1", "b2", "b3", "b4", "c1", "c2", "c3", "c4", "d1", "d2", "d3", "d4"], ai_coordinates
  end
end