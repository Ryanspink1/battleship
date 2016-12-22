require 'colorize'
require 'pry'

class GameBoard

  def ai_place_first_coordinate_of_two_space_ship
    ai_coordinates = %w[a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4]
    @first_coordinate = ai_coordinates.sample(1)
    find_letter_of_second_coordinate_of_two_space_ship
  end
      
  def find_letter_of_second_coordinate_of_two_space_ship
    if @first_coordinate[0][0] == "a"
      potential_letter_second = %w[a b]
    elsif @first_coordinate[0][0] == "b"
      potential_letter_second = %w[a b c]
    elsif @first_coordinate[0][0] == "c"
      potential_letter_second = %w[b c d]
    else @first_coordinate[0][0] == "d"
      potential_letter_second = %w[c d]
    end
    @letter_of_second_coordinate = potential_letter_second.sample(1)
    find_number_of_second_coordinate_of_two_space_ship
  end

  def find_number_of_second_coordinate_of_two_space_ship
    @number_of_second_coordinate = []
      if @first_coordinate[0][0] != @letter_of_second_coordinate[0]
        @number_of_second_coordinate << @first_coordinate[0][1]
      elsif @first_coordinate[0][1] == "1"
        potential_number_second = %w[1 2]
        @number_of_second_coordinate = potential_number_second.sample(1)
      elsif @first_coordinate[0][1] == "2"
        potential_number_second = %w[1 2 3]
        @number_of_second_coordinate = potential_number_second.sample(1)
      elsif @first_coordinate[0][1] == "3"
        potential_number_second = %w[2 3 4]
        @number_of_second_coordinate = potential_number_second.sample(1)
      else @first_coordinate[0][1] == "4"
        potential_number_second = %w[3 4]
        @number_of_second_coordinate = potential_number_second.sample(1)
      end
      put_coordinates_together
  end

  def put_coordinates_together
    ai_coordinate = @first_coordinate
    ai_second_coordinate_preliminary = @letter_of_second_coordinate + @number_of_second_coordinate
    @ai_second_coordinate = []
    @ai_second_coordinate << ai_second_coordinate_preliminary.join
    board_correction
  end

  def board_correction
    if @first_coordinate == @ai_second_coordinate
      find_letter_of_second_coordinate_of_two_space_ship
    else
      ai_place_first_coordinate_of_three_space_ship
    end
  end

  def ai_place_first_coordinate_of_three_space_ship
    ai_coordinates_three = %w[a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4] - @first_coordinate - @ai_second_coordinate
    @first_coordinate_three = ai_coordinates_three.sample(1)
    find_letter_of_second_coordinate_of_three_space_ship
  end
      
  def find_letter_of_second_coordinate_of_three_space_ship
    if @first_coordinate_three[0][0] == "a"
      potential_letter_second_three = %w[a b]
    elsif @first_coordinate_three[0][0] == "b"
      potential_letter_second_three = %w[a b c]
    elsif @first_coordinate_three[0][0] == "c"
      potential_letter_second_three = %w[b c d]
    else @first_coordinate_three[0][0] == "d"
      potential_letter_second_three = %w[c d]
    end
    @letter_of_second_coordinate_three = potential_letter_second_three.sample(1)
    find_number_of_second_coordinate_of_three_space_ship
  end

  def find_number_of_second_coordinate_of_three_space_ship
    @number_of_second_coordinate_three = []
      if @first_coordinate_three[0][0] != @letter_of_second_coordinate_three[0]
        @number_of_second_coordinate_three << @first_coordinate_three[0][1]
      elsif @first_coordinate_three[0][1] == "1"
        potential_number_second_three = %w[1 2]
        @number_of_second_coordinate_three = potential_number_second_three.sample(1)
      elsif @first_coordinate_three[0][1] == "2"
        potential_number_second_three = %w[1 2 3]
        @number_of_second_coordinate_three = potential_number_second_three.sample(1)
      elsif @first_coordinate_three[0][1] == "3"
        potential_number_second_three = %w[2 3 4]
        @number_of_second_coordinate_three = potential_number_second_three.sample(1)
      else @first_coordinate_three[0][1] == "4"
        potential_number_second_three = %w[3 4]
        @number_of_second_coordinate_three = potential_number_second_three.sample(1)
      end
      put_coordinates_together_three
  end

  def put_coordinates_together_three
    ai_coordinate_three = @first_coordinate_three
    ai_second_coordinate_preliminary_three = @letter_of_second_coordinate_three + @number_of_second_coordinate_three
    @ai_second_coordinate_three = []
    @ai_second_coordinate_three << ai_second_coordinate_preliminary_three.join
    board_correction_three
  end

  def board_correction_three
    if @first_coordinate_three == @ai_second_coordinate_three
      find_letter_of_second_coordinate_of_three_space_ship
    elsif @ai_second_coordinate_three == @first_coordinate
      find_letter_of_second_coordinate_of_three_space_ship
    elsif @ai_second_coordinate_three == @ai_second_coordinate
      find_letter_of_second_coordinate_of_three_space_ship
    else
      find_letter_of_third_coordinate_of_three_space_ship
    end
  end



  def find_letter_of_third_coordinate_of_three_space_ship
    if @first_coordinate_three[0][0] == @ai_second_coordinate_three[0][0]
      @third_coordinate_letter_three = @first_coordinate_three[0][0]
      @third_coordinate_number_three = @ai_second_coordinate_three[0][1].next
    else 
      @third_coordinate_number_three = @first_coordinate_three[0][1]
      @third_coordinate_letter_three = @ai_second_coordinate_three[0][0].next
    end
      @third_coordinate_ship_three = @third_coordinate_letter_three + @third_coordinate_number_three
      correct_third_coordinate_letter_three
  end


   def correct_third_coordinate_letter_three
    potential_coordinates = %w[a1 a2 a3 a4 b1 b2 b3 b4 c1 c2 c3 c4 d1 d2 d3 d4] - @first_coordinate - @ai_second_coordinate - @first_coordinate_three - @ai_second_coordinate_three
      if potential_coordinates.include? @third_coordinate_ship_three
      else
        ai_place_first_coordinate_of_three_space_ship
      end
      combine_coordinates
    end
  
  def combine_coordinates
    # puts @first_coordinate.class
    # puts @ai_second_coordinate.class
    # puts @first_coordinate_three.class
    # puts @ai_second_coordinate_three.class
    # puts @third_coordinate_ship_three.class
  end

    
  g = GameBoard.new
  # g.ai_place_first_coordinate_of_three_space_ship
  g.ai_place_first_coordinate_of_two_space_ship
  # print @ai_ships
end
     

