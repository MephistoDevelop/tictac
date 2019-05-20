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
    plays = merge_plays
    arr_player=[]
    arr_player2=[]
        plays.each{|x,y|
          if(y=='⭕️')
            arr_player2.push(x)
          end }
          plays.each{|x,y|

            if(y=='❌')
              arr_player.push(x)
            end }
  if get_plays_count > 0
    @win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @win.each{|array|
     if arr_player.size > 2
        sort_player = (arr_player & array).sort
        #puts "jugador 1 gana"
      end
      if arr_player2.size > 2
        sort_player2 = (arr_player2 & array).sort
        #puts "jugador 2 gana"
      end
      # puts "Esto son win pathern #{array}: y esto es player1 #{  arr_player } : player2 #{ arr_player2 } \n sort_player : #{sort_player}: sort_player2 : #{sort_player2} "
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
end