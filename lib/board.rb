class Board
  attr_accessor :draw, :playing, :plays, :winner
  def initialize
    @draw = false
    @playing = true
    @plays = {}
    @winner = false
  end
  def play(square)
    if(square == 1)
      @winner = true
    end
    @plays[square] = @plays.length == 0 || (@plays.length + 1)%2 != 0
  end
  def get_plays
      return @plays
  end
  def get_active
    return @plays.length == 0 || (@plays.length + 1)%2 != 0
  end
end