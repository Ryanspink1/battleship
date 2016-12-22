require './lib/game_board'
require './lib/setup'

class Battleship
  setup = Setup.new
  setup.opening_sequence
  ai_setup = ComputerShipPlaceent.new
  ai_setup.ai_place_first_coordinate_of_two_space_ship
end
