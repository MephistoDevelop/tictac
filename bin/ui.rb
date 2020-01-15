$track={}
$turn=0
$player=['❌','⭕️']
$counter=0

class UI
  attr_accessor :game

  def initialize
    puts "LOADING UI"
    game=false
  end

  def switch_turn
    if $turn == 0
      $turn= 1
    else
      $turn=0
    end
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
      game=true
    else
      game=false
    end
     while(game)
      puts "~~~~~"
      puts "CHOOSE EMPTY SQUARE"
      puts ""
      show_board()
      option = gets.chomp
      unless option.to_i.between?(1,9)
        puts "CHOOSE EMPTY SQUARE"
        puts ""
        option = gets.chomp
      end
      option.to_i
      $track[option.to_i] = $player[$turn]
      switch_turn()
      show_board()
      $counter+=1
    if $counter == 9
      puts "Draw Game"
      return $game=false
    end
    end
  end


  def show_board()
    puts ""
    puts " #{$track[1] == nil ? "1" : $track[1] } | #{$track[2] == nil ? "2" : $track[2] } | #{$track[3] == nil ? "3" : $track[3] } "
    puts "---|---|---"
    puts " #{$track[4] == nil ? "4" : $track[4] } | #{$track[5] == nil ? "5" : $track[5] } | #{$track[6] == nil ? "6" : $track[6] } "
    puts "---|---|---"
    puts " #{$track[7] == nil ? "7" : $track[7] } | #{$track[8] == nil ? "8" : $track[8] } | #{$track[9] == nil ? "9" : $track[9] } "
    puts ""
  end

  def show_winner(board)
    show_board()
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