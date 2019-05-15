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
    puts ""
    puts "#{board.get_active ? "❌ " : "⭕️ "} MOVES"
    puts show_board(board)
    puts ""
    puts "~~~~~"
    puts "CHOOSE EMPTY SQUARE"
    option = gets.chomp
    unless option.to_i.between?(1,9)
      puts "CHOOSE EMPTY SQUARE"
      option = gets.chomp
    end
    option.to_i
  end
  def show_board(board)
   plays = board.get_plays

   puts ""
   puts " #{plays[1] == nil ? "1" :  render_player(plays[1]) } | #{plays[2] == nil ? "2" :  render_player(plays[2]) } | #{plays[3] == nil ? "3" :  render_player(plays[3]) } "
   puts "---|---|---"
   puts " #{plays[4] == nil ? "4" :  render_player(plays[4]) } | #{plays[5] == nil ? "5" :  render_player(plays[5]) } | #{plays[6] == nil ? "6" :  render_player(plays[6]) } "
   puts "---|---|---"
   puts " #{plays[7] == nil ? "7" : render_player( plays[7]) } | #{plays[8] == nil ? "8" :  render_player(plays[8]) } | #{plays[9] == nil ? "9" :  render_player(plays[9]) } "
   puts ""
  end
  def render_player(player)
    player ? "❌" : "⭕️"
  end
  def show_result(board)
    show_board(board)
    if board.draw
      puts "IT'S A DRAW !!"
    elsif board.winner
     puts "THE WINNER IS #{render_player(board.last_play.first)}"
    end
  end
  def quit
    puts "EXIT"
  end
end
