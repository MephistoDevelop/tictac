class UI
  def initialize(title)
    puts "&&&&&&&&&&&&&"
    puts "#{title} starting"
    puts "&&&&&&&&&&&&&"
    puts ""
  end
  def new_game
    puts "====================="
    puts "New Game?"
    puts " 1:START"
    puts " 0:EXIT"
    puts "====================="
    puts ""
    @input = gets.chomp.to_i
    case @input
    when 1
      true
    else
      @play = false
      false
    end
  end
  def new_round(board)
    puts "❌ MOVES show who is playing"
    puts show_board(board)
    puts ""
    puts "~~~~~"
    puts "CHOOSE EMPTY SQUARE"
    option = gets.chomp
    unless option.to_i.between?(1, 9)
      puts "CHOOSE EMPTY SQUARE"
      option = gets.chomp
    else
      return option.to_i
    end
  end
  def show_board(board)
    puts "SHOW BOARD"
  end
  def show_result(board)
    puts "THE WINNER IS"
  end
  def quit
    puts "EXIT"
  end
end
