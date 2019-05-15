require "./bin/ui"
require "./lib/board"

ui = UI.new("GAME")

while ui.new_game do
  board = Board.new
  while board.playing
    board.play(ui.new_round(board))
    if board.winner || board.draw
      puts ui.show_result(board)
      break
    end
  end
end

ui.quit

exit