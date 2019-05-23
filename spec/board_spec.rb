require './lib/board.rb'
require './lib/player.rb'

RSpec.describe Board do
  describe "#draw?" do
    it "check if the game is a draw" do
     player1 =Player.new('❌')
     player2 =Player.new('⭕️')
    board = Board.new(player1,player2)
    expect(board.draw?).to eql(false)
  end
end

  describe "#check_horizontal_winner" do
    it "check if some player win at top" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      expect(board.check_winner).to eql(false)
    end
  end

  describe "#check_vertical_winner" do
    it "check if some player win at vertical" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      expect(board.check_winner).to eql(false)
    end
  end

  describe "#check_cross_winner" do
    it "check if some player win at cross" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      expect(board.check_winner).to eql(false)
    end
  end

  describe "#get_plays_count" do
    it "check the number of plays of each player" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      expect(board.get_plays_count).to eql(0)
    end
  end

end