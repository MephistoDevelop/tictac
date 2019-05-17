class Board
  attr_accessor :player1
  attr_accessor :player2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  def check_play(square)
    plays = merge_plays
    return true if plays[square]
    false
  end
  def merge_plays
    @player1.plays.merge(@player2.plays)
  end
  def play(square)
    if ((get_plays_count + 1) % 2 != 0)
      @player1.make_play(square)
    else
      @player2.make_play(square)
    end
  end
  def playing
    return false if check_winner || draw?
    true
  end
  def draw?
    case get_plays_count
    when 9
      return true if !check_winner
      false
    else
      false
    end
  end
  def get_plays_count
    plays = merge_plays
    plays.length
  end
  def check_winner
    check_horizontal ||  check_vertical || check_cross
  end
  def check_horizontal
    plays = merge_plays
    winner = false
    for i in [1,4,7] do
      if plays[i] != nil
        if(plays[i] == plays[i+1] && plays[i+1] == plays[i+2])
          winner = true
          break if winner
        end
      end
    end
    winner
  end
  def check_vertical
    plays = merge_plays
    winner = false
    for i in [1,2,3] do
      if(plays[i] != nil)
      if (plays[i] == plays[i+3] && plays[i+3] == plays[i+6])
        winner = true
        break if winner
      end
    end
    end
    winner
  end
  def check_cross
    plays = merge_plays
    winner = false
    if(plays[1] != nil && plays[3] != nil && plays[5] != nil || plays[7] != nil && plays[9] != nil )
      if (plays[1] ==plays[5] && plays[1] ==plays[9] )
        winner = true
      end
      if (plays[3] == plays[5] && plays[3] == plays[7] )
      winner = true
      end
    end
    winner
  end
  def winner
    return @player2.name if get_plays_count % 2 == 0
    @player1.name
  end
end