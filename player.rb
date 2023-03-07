class Player
  def initialize(playerName)
    @player = playerName
    @lives = 3
  end

  attr_accessor :player, :lives
end