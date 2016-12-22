require 'colorize'
require './lib/messages'
require './lib/setup'
require './lib/game_board'

class Game

  def initialize
  end


  def get_player_coordinates
    Messages.ship_placement_one
    @two_unit_ship_coordinates = gets.chomp
    Messages.ship_placement_two
    @three_unit_ship_coordinates = gets.chomp
    shot_phase
  end

  def shot_phase
    shot_coordinates = %w[a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4]
    shot = shot_coordinates.sample(1)
      if shot.include? @two_unit_ship_coordinates || @three_unit_ship_coordinates
        puts "HIT"
      else
        player_shot
      end
  end

  def ai_shot
    shot_phase
  end
end