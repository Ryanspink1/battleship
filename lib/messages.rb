require 'colorize'


module Messages

  def self.opening_message
    puts "-------------------------------------------------------------".blue
    print "Welcome to:".green
    print "\t _.:SPACEBATTLE:._".red
    puts "\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>".green
    puts "-------------------------------------------------------------".blue
  end

  def self.instructions
    print "    The AI will place one 2 unit and one 3 unit spaceship\n
    on a 4x4 grid. The user will then do the same. The user\n
    and AI will then trade shots upon the others grid until\n 
    one player has annihilated the others fleet out of\n
    existence.".red
    puts"\n-------------------------------------------------------------".blue
  end

  def self.invalid_selection
    puts "Your selection is not valid, please reenter directive".yellow
  end

  def self.quit
    puts "Back to the Earth, you OMADHAUN!".yellow
  end

  def self.ship_placement_one
    puts "    I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.

    Enter the squares for the two-unit ship:".green
  end

  def self.ship_placement_two
    puts "   Enter the squares for the three-unit ship".green
  end

end