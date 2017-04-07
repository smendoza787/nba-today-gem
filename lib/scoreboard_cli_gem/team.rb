class Team
  attr_accessor :name, :score, :matches

  def initialize(name, score)
    @name = name
    @score = score
    @matches = []
  end
end
