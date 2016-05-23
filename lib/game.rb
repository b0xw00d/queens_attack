require_relative 'runner'

class Game
  attr_reader :board, :white_position, :black_position

  def initialize(args={})
    @board = Array.new(8) { Array.new(8, "o") }
    @white_position = args.fetch(:white, [0,0])
    @black_position = args.fetch(:black, [7,7])
  end

  def set_pieces
    board[white_position.first.to_i][white_position.last.to_i] = "w"
    board[black_position.first.to_i][black_position.last.to_i] = "b"
    board
  end

  def print_board
    set_pieces.map {|row| row.join(" ") }.join("\n") + "\n"
  end

  def is_a_hit?
    check_horizontal || check_vertical || check_diagonal
  end

  private

  def check_horizontal
    white_position.first == black_position.first
  end

  def check_vertical
    white_position.last == black_position.last
  end

  def check_diagonal
    horizontal_difference = white_position.first.to_i - black_position.first.to_i
    vertical_difference = white_position.last.to_i - black_position.last.to_i
    horizontal_difference.abs == vertical_difference.abs
  end
end
