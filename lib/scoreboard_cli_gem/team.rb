class Team
  attr_accessor :name, :score, :league

  def initialize(name, league)
    @name = name
    @league = league
    @score = Score.new(self.league)
  end
end
