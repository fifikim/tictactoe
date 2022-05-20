module InputValidators

  def validate_selection(selection)
    index = selection.to_i - 1

    if invalid? selection
      @console.output('Invalid character! Please select an integer from 1-9:')
      select_space
    elsif occupied? index
      @console.output('Invalid move! Please select a free space:')
      select_space
    else
      @board.record_move(@current_player.mark, index)
    end
  end

  def invalid?(input)
    /^([1-9])$/.match(input).nil?
  end

  def occupied?(index)
    @board.spaces[index] == @current_player.mark || @board.spaces[index] == @next_player.mark
  end
end