require './lib/board.rb'
require './lib/player.rb'

RSpec.describe Board do

@player1 =Player.new('❌')
@player2 =Player.new('⭕️')
$board = Board.new(@player1,@player2)

  describe "#draw?" do
    it "check if the game is a draw" do
     game =$board.set_plays({1 => '❌' , 2 => '⭕️' , 3 => '❌', 4 => '❌',5   =>'⭕️' ,6 =>'❌',7 => '⭕️', 8 => '❌', 9 => '⭕️'} )
    expect($board.draw?).to eql(true)
  end
end
  describe "#check_winning_pattern"do
    it "win on top row" do
      $board.set_plays({1 => '❌' , 2 => '❌' , 3 => '❌', 4 => '⭕️', 5 => '⭕️'} )
      expect($board.check_winner).to eql(true)
     end
     it "win on column" do
      $board.set_plays({1 =>  '❌' , 2 =>  '⭕️' , 4 => '❌', 5   =>  '⭕️' ,7 => '❌'} )
      expect($board.check_winner).to eql(true)
    end
    it "win cross" do
      $board.set_plays({1 =>  '❌' , 2 =>  '⭕️' , 3 =>  '⭕️',  5   =>  '❌' ,9 =>'❌'} )
      expect($board.check_winner).to eql(true)
    end
  end
  describe "#get_plays_count" do
    it "check the number of plays of each player" do
      expect($board.get_plays_count).to eql(5)
    end
  end
end