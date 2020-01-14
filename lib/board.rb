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
    case get_plays_count
    when 9
      return true if !check_winner
      false
    else
      false
    end
  end
  def get_plays_count
    @@plays.length
  end
  def check_winner
    arr_player=[]
    arr_player2=[]
    @@plays.each{|x,y|
        if(y=='⭕️')
          arr_player2.push(x)
        elsif(y=='❌')
            arr_player.push(x)
             end
        }
    if get_plays_count > 0
    @win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @win.each{|array|
     if arr_player.size > 2
        sort_player = (arr_player & array).sort
      end
      if arr_player2.size > 2
        sort_player2 = (arr_player2 & array).sort
      end
      if (array==sort_player || array==sort_player2 )
        return true
      end
      }
    end
      return false
  end
  def winner
    return @player2.name if get_plays_count % 2 == 0
    @player1.name
  end
  def make_play(square)
    if (get_plays_count % 2 == 0)
      @name = '❌'
    else
      @name = '⭕️'
    end
    @@plays[square] = @name
  end
  def plays
    @@plays
  end
  def set_plays(plays)
    @@plays = plays
  end
end