# frozen_string_literal: true

class Board
  attr_accessor :player1
  attr_accessor :player2, :plays
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @plays = {}
  end

  def check_play(square)
    return true if @plays[square]

    false
  end

  def play(square)
    make_play(square)
  end

  def playing
    return false if check_winner || draw?

    true
  end

  def draw?
    puts 'Draw?:'
    case gets_plays_count

    when 9
      return true unless check_winner

      false
    end
  end

  def gets_plays_count
    @plays.length
  end
  # rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity

  def check_winner
    arr_player = []
    arr_player2 = []
    @plays.each do |x, y|
      if y == '⭕️'
        arr_player2.push(x)
      elsif y == '❌'
        arr_player.push(x)
      end
    end

    if gets_plays_count.positive?
      @win = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
      @win.each do |array|
        sort_player = (arr_player & array).sort if arr_player.size > 2
        sort_player2 = (arr_player2 & array).sort if arr_player2.size > 2
        return true if array == sort_player || array == sort_player2
      end
    end
    false
  end

  # rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity

  def winner
    return @player2.name if gets_plays_count.even?

    @player1.name
  end

  def make_play(square)
    @name = if gets_plays_count.even?
              '❌'
            else
              '⭕️'
            end
    @plays[square] = @name
  end

  def make_plays(plays)
    @plays = plays
  end
end
