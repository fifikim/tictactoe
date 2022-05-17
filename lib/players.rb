class Players
  attr_reader :player1, :player2
  
  def initialize(players)
    @player1 = players[0]
    @player2 = players[1]
  end
end