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
    puts "PLAYED ON #{square}"
  end
end