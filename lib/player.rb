class Player
  attr_reader :player_name, :player_value

  def initialize (name, value)
    @player_name = name
    @player_value = value == "x" ? 1 : 0
  end
end
