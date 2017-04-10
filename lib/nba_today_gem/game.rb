class NbaTodayGem::Game
  attr_accessor :status, :score, :venue, :top_peformers, :home_team, :away_team, :url, :recap, :date

  @@all = []

  def initialize
    @top_peformers = {}
    @@all << self
  end

  def away_team=(away_team)
    if !away_team.is_a?(NbaTodayGem::Team)
      raise TypeError, "must be a Team object"
    else
      @away_team = away_team
    end
  end

  def home_team=(home_team)
    if !home_team.is_a?(NbaTodayGem::Team)
      raise TypeError, "must be a Team object"
    else
      @home_team = home_team
    end
  end

  def self.all
    @@all
  end

end
