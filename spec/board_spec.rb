require './lib/board.rb'
require './lib/player.rb'

RSpec.describe Board do
  describe "#draw?" do
    it "check if the game is a draw" do
    player1 =Player.new('❌')
    player2 =Player.new('⭕️')
    board = Board.new(player1,player2)
    player1.make_play(1)
    player2.make_play(2)
    player1.make_play(3)
    player2.make_play(5)
    player1.make_play(6)
    player2.make_play(7)
    player1.make_play(8)
    player2.make_play(9)
    player1.make_play(4)
    expect(board.draw?).to eql(true)
  end
end

  describe "#check_horizontalwinner" do
    it "check if some player win at top" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      player1.make_play(1)
      player2.make_play(5)
      player1.make_play(2)
      player2.make_play(4)
      player1.make_play(3)
      expect(board.check_winner).to eql(true)
    end
  end

end