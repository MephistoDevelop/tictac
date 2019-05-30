require './lib/player.rb'

RSpec.describe Player do
  describe "#name" do
    it "returns players name" do
      player = Player.new("X")
      expect(player.name).to eql("X")
      end
    end
  end