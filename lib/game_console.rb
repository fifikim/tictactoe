# frozen_string_literal: true

require_relative 'console'

class GameConsole < Console
  def initialize(board_size = 9)
    super
    @board_size = board_size
    @line_length = Math.sqrt(board_size).to_i
  end

  def instructions(player1, player2)
    name1 = translate(player1.name)
    name2 = translate(player2.name)
    instructions_msg = translate('instructions', board_size: @board_size, line_length: @line_length,
                                                 name1:, marker1: player1.marker, name2:, marker2: player2.marker)
    output(instructions_msg)
  end

  def board(current_board)
    board_output = fill_template(current_board.spaces)
    output(board_output)
  end

  def invalid
    msg = translate('error.character', board_size: @board_size)
    output(msg)
  end

  def turn(turn_message, player)
    player_name = translate(player)
    turn_msg = translate(turn_message, player: player_name)
    output(turn_msg)
  end

  def occupied
    msg = translate('error.occupied')
    output(msg)
  end

  def win(player)
    player_name = translate(player)
    win_msg = translate('won', winner: player_name)
    output(win_msg)
  end

  def draw
    draw_msg = translate('draw')
    output(draw_msg)
  end

  private

  def fill_template(array)
    rows = split_rows(array)
    format_board(rows)
  end

  def format_board(rows)
    board = rows.map { |row| format_row(row) }.join(horizontal_line)
    "\n#{board}\n"
  end

  def format_row(row)
    formatted_row = row.map { |space| format_space(space) }.join('|')
    "#{formatted_row}\n"
  end

  def format_space(space)
    " #{space.to_s.rjust(2)} "
  end

  def split_rows(array)
    array.each_slice(@line_length).to_a
  end

  def horizontal_line
    spacer_line = []
    @line_length.times { spacer_line << '----' }
    spacer_line.join('|').concat("\n")
  end
end
