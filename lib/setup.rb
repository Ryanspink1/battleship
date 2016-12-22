require 'colorize'
require './lib/messages'
require './lib/game'

class Setup

  def opening_sequence
    Messages.opening_message
    input = gets.chomp
    start_game(input)
  end
  
  def start_game(input)
    if input == "p"
      g = Game.new
      g.get_player_coordinates
    elsif input == "i"
      instructions
    elsif input == "q"
      Messages.quit
      exit
    else
      Messages.invalid_selection
      input = gets.chomp
      start_game(input)
    end
  end
    
  def instructions
    Messages.instructions
    sleep(5)
    opening_sequence
  end

end