require_relative "./ui"
require_relative "../lib/board"
require_relative "../lib/player"

ui = UI.new

while ui.new_game? do
  player1 = Player.new("❌")
  player2 = Player.new("⭕️")
  board = Board.new(player1, player2)
  ui.start
  while board.playing
    square = ui.ask_square(board)
    while board.check_play(square)
      square = ui.ask_square(board)
    end
    board.play(square)
  end
  if(board.check_winner)
    ui.show_winner(board)
  else
    ui.show_draw(board)
  end
end

ui.quit