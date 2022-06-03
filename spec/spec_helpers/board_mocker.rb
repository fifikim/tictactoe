# frozen_string_literal: true

module BoardMocker
  def self.fill(board_size, moves = {})
    mock_board = (1..board_size).to_a

    moves.each do |marker, spaces|
      spaces.each do |space|
        mock_board[space - 1] = marker.to_s
      end
    end

    mock_board
  end
end
