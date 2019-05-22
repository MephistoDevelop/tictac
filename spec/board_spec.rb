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

  describe "#check_horizontal_winner" do
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

  describe "#check_vertical_winner" do
    it "check if some player win at vertical" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      player1.make_play(1)
      player2.make_play(5)
      player1.make_play(4)
      player2.make_play(3)
      player1.make_play(7)
      expect(board.check_winner).to eql(true)
    end
  end

  describe "#check_cross_winner" do
    it "check if some player win at cross" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      player1.make_play(1)
      player2.make_play(3)
      player1.make_play(5)
      player2.make_play(8)
      player1.make_play(9)
      expect(board.check_winner).to eql(true)
    end
  end

  describe "#get_plays_count" do
    it "check the number of plays of each player" do
      player1 =Player.new('❌')
      player2 =Player.new('⭕️')
      board = Board.new(player1,player2)
      player1.make_play(1)
      player2.make_play(3)
      player1.make_play(5)
      player2.make_play(8)
      player1.make_play(9)
      expect(board.get_plays_count).to eql(5)
    end
  end

end