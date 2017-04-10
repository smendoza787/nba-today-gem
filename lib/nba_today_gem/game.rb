class Game
  attr_accessor :status, :score, :venue, :top_peformers, :league, :home_team, :away_team, :url

  @@all = []

  def initialize(league)
    @league = league
    @top_peformers = {}
    @@all << self
  end

  def away_team=(away_team)
    if !away_team.is_a?(Team)
      raise TypeError, "must be a Team object"
    else
      @away_team = away_team
    end
  end

  def home_team=(home_team)
    if !home_team.is_a?(Team)
      raise TypeError, "must be a Team object"
    else
      @home_team = home_team
    end
  end

  def self.all
    @@all
  end

  def get_top_performers
    # will return hash of player objects


  end

end
