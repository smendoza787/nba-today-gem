class Match
  attr_accessor :state, :day
  attr_reader :home_team, :away_team

  def initialize(day)
    @day = day
    self.day.matches << self
  end

  def home_team=(home_team)
    @home_team = home_team
    home_team.matches << self
  end

  def away_team=(away_team)
    @away_team = away_team
    away_team.matches << self
  end
end
