require_relative "./ui"
require_relative "../lib/player"

ui = UI.new

while ui.new_game? do
  player1 = Player.new("❌")
  player2 = Player.new("⭕️")
  ui.start
end

ui.quit

