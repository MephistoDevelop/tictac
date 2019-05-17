class Player
  attr_accessor :name
  def initialize(name)
    @name = name
    @@plays = {}
  end
  def make_play(square)
    @@plays[square] = @name
  end
  def plays
    @@plays
  end
  def name
    @name
  end
end