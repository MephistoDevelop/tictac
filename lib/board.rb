class Board
  attr_accessor :draw, :playing, :plays, :winner, :last_play
  def initialize
    @draw = false
    @playing = true
    @plays = {}
    @winner = false
    @last_play={}
  end
  def play(square)
    if(@plays[square] == nil)
      @plays[square] = @plays.length == 0 || (@plays.length + 1)%2 != 0
      @last_play={}
      @last_play[square]=@plays[square]
    else
      false
    end
    check_winner
    check_draw
  end
  def get_plays
      return @plays
  end
  def get_active
    return @plays.length == 0 || (@plays.length + 1)%2 != 0
  end
  def check_horizontal
    @winner = false
    for i in [1,4,7] do
      if @plays[i] != nil
        if(@plays[i] == @plays[i+1] && @plays[i+1] == @plays[i+2])
          @winner = true
          break if @winner
        end
      end
    end
    winner
end
def check_vertical
  @winner = false
  for i in [1,2,3] do
    if(@plays[i] != nil)
    if (@plays[i] == @plays[i+3] && @plays[i+3] == @plays[i+6])
      @winner = true
      break if @winner
    end
  end
  end
  winner
end
def check_cross
  winner = false
  if(@plays[1] != nil && @plays[3] != nil && @plays[5] != nil || @plays[7] != nil && @plays[9] != nil )
    if (@plays[1] ==@plays[5] && @plays[1] ==@plays[9] )
      @winner = true
      puts ""
      @playing = false
    end
    if (@plays[3] == @plays[5] && @plays[3] == @plays[7] )
    winner = true
    puts ""
    @playing = false
    end
  end
  winner
end
def check_draw
  if (@plays.length == 9 && @winner==false)
   @playing = false
   @draw=true
   true
  else
    false
  end
end
def check_winner
   return check_horizontal ||  check_vertical || check_cross
end
end