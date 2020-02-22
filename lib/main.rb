# frozen_string_literal: true

require_relative './ui'
require_relative './board'
require_relative './player'

def ask_square(board)
  show_board(board)
  puts '~~~~~'
  puts 'CHOOSE EMPTY SQUARE'
  puts ''
  option = gets.chomp
  unless option.to_i.between?(1, 9)
    puts 'CHOOSE EMPTY SQUARE'
    puts ''
    option = gets.chomp
  end
  option.to_i
end

def new_game?
  puts '====================='
  puts 'New Game?'
  puts ' 1:START'
  puts ' 0:EXIT'
  puts '====================='
  puts ''

  input = gets.chomp.to_i
  case input
  when 1
    puts '====================='
    puts 'Write Player 1 Name: '
    @player1_name = gets.chomp
    puts '====================='
    puts 'Write Player 2 Name: '
    @player2_name = gets.chomp
    puts '====================='
    true
  else
    false
  end
end

def show_board(board)
  plays = board.plays
  puts ''
  check_line1(plays)
  puts '---|---|---'
  check_line2(plays)
  puts '---|---|---'
  check_line3(plays)
  puts ''
end

def check_line1(plays)
  puts " #{plays[1].nil? ? '1' : plays[1]} | #{plays[2].nil? ? '2' : plays[2]} | #{plays[3].nil? ? '3' : plays[3]} "
end

def check_line2(plays)
  puts " #{plays[4].nil? ? '4' : plays[4]} | #{plays[5].nil? ? '5' : plays[5]} | #{plays[6].nil? ? '6' : plays[6]} "
end

def check_line3(plays)
  puts " #{plays[7].nil? ? '7' : plays[7]} | #{plays[8].nil? ? '8' : plays[8]} | #{plays[9].nil? ? '9' : plays[9]} "
end

def show_winner(board)
  show_board(board)

  puts ''
  name = if board.gets_plays_count.even?
           @player2_name
         else
           @player1_name
         end
  puts "The whinner is #{name}"
  puts ''
end

def start
  puts ''
  puts "GAME STARTING!, Player #{@player1_name} with  ❌  goes first!"
  puts ''
end

def quit
  puts '---'
  puts 'Follow us on Github! @mephistodevelop @noincomedev'
  puts '---'
  exit
end

def show_draw(board)
  show_board(board)
  puts ''
  puts 'ITS A DRAW'
  puts ''
end

while new_game?
  player1 = Player.new('❌')
  player2 = Player.new('⭕️')
  board = Board.new(player1, player2)
  start
  while board.playing
    square = ask_square(board)
    square = ask_square(board) while board.check_play(square)
    board.play(square)
  end
  if board.check_winner
    show_winner(board)
  else
    show_draw(board)
  end
end

quit
