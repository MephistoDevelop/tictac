class Board
  attr_accessor :player1
  attr_accessor :player2, :plays
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @@plays = {}
  end
  def check_play(square)
    return true if @@plays[square]
    false
  end
  def play(square)
    if ((get_plays_count + 1) % 2 != 0)
    make_play(square)
    else
    make_play(square)
    end
  end
  def playing
    return false if check_winner || draw?
    true
  end
  def draw?

  end

  def check_winner
      return false
  end
  def winner

  end
  def make_play(square)

  end
end