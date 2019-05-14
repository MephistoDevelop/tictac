require "./bin/ui"
require "./lib/board"

ui = UI.new("GAME")

if ui.new_game
  board = Board.new
  while board.playing
    board.play(ui.new_round(board))
    puts board.get_plays().each{|square| square}
    if board.winner || board.draw
      puts ui.show_result(board)
      break
    end
  end
  ui.new_game
else
  ui.quit
  exit
end