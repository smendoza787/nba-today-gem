require 'Date'

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

  def add_match(away_team, a_score, home_team, h_score)
    new_match = Match.new(self)
    new_match.away_team = away_team
    new_match.scores[new_match.away_team.name] = a_score
    new_match.home_team = home_team
    new_match.scores[new_match.home_team.name] = h_score

    self.matches << new_match
  end
end
