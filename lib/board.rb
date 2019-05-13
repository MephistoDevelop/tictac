class Board
  attr_accessor :playing , :check_winner
  attr_accessor :plays
  def initialize
    @playing = true
    @plays = {}
    puts ""
    puts "Game starting"
    puts "&&&&&&&&&&&&&"
    puts ""
  end


end