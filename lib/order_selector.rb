# frozen_string_literal: true

module OrderSelector
  ORDER_OPTIONS = {
    '1' => proc { |players| [players[0], players[1]] },
    '2' => proc { |players| [players[1], players[0]] }
  }.freeze

  def select_order(unordered_players)
    order = $stdin.gets.strip

    if ORDER_OPTIONS.include? order
      ordered_players = ORDER_OPTIONS[order].call(unordered_players)
      ordered_players[0].store(:marker, 'X')
      ordered_players[1].store(:marker, 'O')
      [ordered_players[0], ordered_players[1]]
    else
      @console.menu_error
      select_order(unordered_players)
    end
  end
end
