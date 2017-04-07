class Day
  attr_accessor :date

  def initialize(date = Time.now.strftime("%Y-%m-%d"))
    @date = date
    @matches = []
  end

  def matches
    @matches
  end

  def show_date
    Date.parse(self.date).strftime("%B %d, %Y")
  end

  def add_match(away_team, home_team, status = "Final")
    new_match = Match.new(self)
    new_match.away_team = away_team
    new_match.home_team = home_team
    new_match.status = status
  end

  def add_match_by_hash(scraped_hash)
    i = 0

    while i < scraped_hash[:home_team_array].length
      away_team = Team.new(scraped_hash[:away_team_array][i], scraped_hash[:away_scores_array][i])
      home_team = Team.new(scraped_hash[:home_team_array][i], scraped_hash[:home_scores_array][i])
      status = scraped_hash[:match_status][i]

      self.add_match(away_team, home_team, status)
      i += 1
    end

    # Match.all
  end

  def show_scores
    self.matches.each do |match|
      print "#{match.away_team.name} : "
      puts "#{match.away_team.score}"
      print "#{match.home_team.name} : "
      puts "#{match.home_team.score}"
      puts match.status
      puts ""
    end
  end
end
