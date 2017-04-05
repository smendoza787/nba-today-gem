class Match
  attr_accessor :status, :day, :scores
  attr_reader :home_team, :away_team

  @@all = []

  def initialize(day)
    if !day.is_a?(Day)
      raise TypeError, "must be a Day object"
    else
      @day = day
      self.day.matches << self
      @@all << self
    end

    @scores = {}
  end

  def away_team=(away_team)
    if !away_team.is_a?(Team)
      raise TypeError, "must be a Team object"
    else
      @away_team = away_team
      away_team.matches << self
    end
  end

  def home_team=(home_team)
    if !home_team.is_a?(Team)
      raise TypeError, "must be a Team object"
    else
      @home_team = home_team
      home_team.matches << self
    end
  end

  def self.all
    @@all
  end

end
