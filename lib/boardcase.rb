class Boardcase
  attr_accessor :position_case, :value_case

  def initialize (position, value=10)
    @position_case = position
    @value_case = value
  end
end
