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

  def self.find(index)
    @@all[index]
  end

  def self.all
    @@all
  end

  def totalscore
    self.home_team.score[0].to_i + self.away_team.score[0].to_i
  end

  def self.sort_by_total_score
    # binding.pry
    NbaTodayGem::Game.all.sort! {|game1, game2| game2.totalscore <=> game1.totalscore}
  end

end
