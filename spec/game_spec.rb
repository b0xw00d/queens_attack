require "spec_helper"

describe Game do

  context "#initialize" do
    let(:game) { Game.new }

    it "is a type of game" do
      expect(game).to be_a Game
    end

    it "knows white's position" do
      expect(game.white_position).to match_array [0,0]
    end

    it "knows black's position" do
      expect(game.black_position).to match_array [7,7]
    end

    it "builds an 8 x 8 board" do
      expect(game.board.length).to eq 8
      expect(game.board.all?{ |row| row.length == 8 }).to eq true
    end

    it "starts with a blank board" do
      expect(
        game.board.all? do |row|
          row.all?{ |cell| cell == "o" }
        end
      ).to eq true
    end
  end

  context "#set_pieces" do
    let(:game) { Game.new(white: [0,7], black: [7,0]) }

    it "places pieces on the board" do
      expect(
        game.set_pieces.all? do |row|
          row.all? {|cell| cell == "o" }
        end
      ).to eq false
    end

    it "places the pieces correctly" do
      expect(game.set_pieces).to match_array [
        %w(o o o o o o o w),
        %w(o o o o o o o o),
        %w(o o o o o o o o),
        %w(o o o o o o o o),
        %w(o o o o o o o o),
        %w(o o o o o o o o),
        %w(o o o o o o o o),
        %w(b o o o o o o o)
      ]
    end
  end

  context "#print_board" do
    let(:game) { Game.new }
    let(:board) do
      "w o o o o o o o\no o o o o o o o\no o o o o o o o\no o o o o o o o\n" +
      "o o o o o o o o\no o o o o o o o\no o o o o o o o\no o o o o o o b\n"
    end

    it "prints a string representation of the board" do
      expect(game.print_board).to eq board
    end
  end

  context "#is_a_hit?" do
    let(:horizontal_hit) { Game.new(white: [0,0], black: [0,1]) }
    let(:vertical_hit) { Game.new(white: [0,0], black: [7,0]) }
    let(:diagonal_hit) { Game.new }
    let(:miss) { Game.new(white: [0,0], black: [1,3]) }

    it "knows when the queens can attack each other" do
      [horizontal_hit, vertical_hit, diagonal_hit].each do |hit|
        expect(hit.is_a_hit?).to eq true
      end
    end

    it "knows when the queens cannot attack each other" do
      expect(miss.is_a_hit?).to eq false
    end
  end

end
