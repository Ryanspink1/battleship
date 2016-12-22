require 'minitest/autorun'
require 'minitest/pride'
require './lib/setup'

class SetupTest < Minitest::Test

  def test_it_exists
    s = Setup.new
    assert_instance_of Setup, s
  end

  def test_start_game_play
    s = Setup.new
    assert_equal true, s.start_game(p)
  end

  def test_start_game_instructions
    s = Setup.new
    assert_equal instructions, s.start_game(i)
  end

end