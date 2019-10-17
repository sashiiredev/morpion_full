class Board
  attr_accessor :array_cases, :count_turn

  def initialize
    @count_turn = -1
    @array_cases = Array.new
    @array_cases << Boardcase.new("A1")
    @array_cases << Boardcase.new("A2")
    @array_cases << Boardcase.new("A3")
    @array_cases << Boardcase.new("B1")
    @array_cases << Boardcase.new("B2")
    @array_cases << Boardcase.new("B3")
    @array_cases << Boardcase.new("C1")
    @array_cases << Boardcase.new("C2")
    @array_cases << Boardcase.new("C3")
  end

  def play_turn(player)
    puts "\nA ton tour #{player.player_name}, que veux-tu faire ?"
    condition = 0
    write = 0
    while condition == 0
      if write == 1
        puts "Mauvaise entrée, recommence."
      end
      write = 1
      print "> "
      choice = gets.chomp.upcase
      @array_cases.each do |c|
        if c.position_case == choice
          if c.value_case != 10
            break
          end
          c.value_case = player.player_value
          condition = 1
        end
      end
    end
  end

  def end_by_equality?
    @count_turn += 1
  return  @count_turn >= 9 ? true : false
  end

  def end_by_victory?
    if @array_cases[0].value_case + @array_cases[1].value_case + @array_cases[2].value_case == 3 \
      || @array_cases[0].value_case + @array_cases[1].value_case + @array_cases[2].value_case == 0 \
      || @array_cases[0].value_case + @array_cases[3].value_case + @array_cases[6].value_case == 3 \
      || @array_cases[0].value_case + @array_cases[3].value_case + @array_cases[6].value_case == 0 \
      || @array_cases[0].value_case + @array_cases[4].value_case + @array_cases[8].value_case == 3 \
      || @array_cases[0].value_case + @array_cases[4].value_case + @array_cases[8].value_case == 0 \
      || @array_cases[3].value_case + @array_cases[4].value_case + @array_cases[5].value_case == 3 \
      || @array_cases[3].value_case + @array_cases[4].value_case + @array_cases[5].value_case == 0 \
      || @array_cases[1].value_case + @array_cases[4].value_case + @array_cases[7].value_case == 3 \
      || @array_cases[1].value_case + @array_cases[4].value_case + @array_cases[7].value_case == 0 \
      || @array_cases[2].value_case + @array_cases[4].value_case + @array_cases[6].value_case == 3 \
      || @array_cases[2].value_case + @array_cases[4].value_case + @array_cases[6].value_case == 0 \
      || @array_cases[6].value_case + @array_cases[7].value_case + @array_cases[8].value_case == 3 \
      || @array_cases[6].value_case + @array_cases[7].value_case + @array_cases[8].value_case == 0 \
      || @array_cases[2].value_case + @array_cases[5].value_case + @array_cases[8].value_case == 3 \
      || @array_cases[2].value_case + @array_cases[5].value_case + @array_cases[8].value_case == 0
      result = 1
    else
      result = 0
    end
    return result == 1 ? true : false
  end

  def screen
    array_to_copy = Array.new
    array_to_print = Array.new
    @array_cases.each do |transf|
      array_to_copy << transf.value_case
    end
    array_to_copy.each do |value|
      if value == 10
        array_to_print << " "
      elsif value == 1
        array_to_print << "x"
      else
        array_to_print << "o"
      end
    end
    puts "
                     1       2       3
                 -------------------------
                 |       |       |       |
           A     |   #{array_to_print[0]}   |   #{array_to_print[1]}   |   #{array_to_print[2]}   |
                 |       |       |       |
                 -------------------------
                 |       |       |       |
           B     |   #{array_to_print[3]}   |   #{array_to_print[4]}   |   #{array_to_print[5]}   |
                 |       |       |       |
                 -------------------------
                 |       |       |       |
           C     |   #{array_to_print[6]}   |   #{array_to_print[7]}   |   #{array_to_print[8]}   |
                 |       |       |       |
                 -------------------------
    "
    end
end
