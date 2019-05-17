class UI
  def initialize
    puts "LOADING UI"
  end
  def ask_square(board)
    show_board(board)
    puts "~~~~~"
    puts "CHOOSE EMPTY SQUARE"
    puts ""
    option = gets.chomp
    unless option.to_i.between?(1,9)
      puts "CHOOSE EMPTY SQUARE"
      puts ""
      option = gets.chomp
    end
    option.to_i
  end
  def new_game?
    puts "====================="
    puts "New Game?"
    puts " 1:START"
    puts " 0:EXIT"
    puts "====================="
    puts ""
    input = gets.chomp.to_i
    case input
    when 1
      true
    else
      false
    end
  end
  def show_board(board)
    plays = board.merge_plays
    puts ""
    puts " #{plays[1] == nil ? "1" : plays[1] } | #{plays[2] == nil ? "2" : plays[2] } | #{plays[3] == nil ? "3" : plays[3] } "
    puts "---|---|---"
    puts " #{plays[4] == nil ? "4" : plays[4] } | #{plays[5] == nil ? "5" : plays[5] } | #{plays[6] == nil ? "6" : plays[6] } "
    puts "---|---|---"
    puts " #{plays[7] == nil ? "7" : plays[7] } | #{plays[8] == nil ? "8" : plays[8] } | #{plays[9] == nil ? "9" : plays[9] } "
    puts ""
  end
  def show_winner(board)
    show_board(board)
    puts ""
    puts "The whinner is #{board.winner}"
    puts ""
  end
  def start
    puts ""
    puts "GAME STARTING! ❌  goes first!"
    puts ""
  end
  def quit
    puts "---"
    puts "Follow us on Github! @mephistodevelop @noincomedev"
    puts "---"
    exit
  end
  def show_draw(board)
    show_board(board)
    puts ""
    puts "ITS A DRAW"
    puts ""
  end
end