class Scraper

  def self.scrape_mlb_scores
    # returns array of team names
    # and array of scores
    # and link to game info URL
  end

  def self.scrape_mlb_game_info
    # returns hash with:
    # box score array
    # top performers array
    # venue
  end

  def self.scrape_nhl_scores
    # returns array of team names
    # and array of scores
    # and link to game info URL
  end

  def scrape_nhl_game_info
    # returns hash with:
    # box score array
    # top performers array
    # venue
  end

<<<<<<< HEAD
    {
      :away_team_array => days.first.css("td.teamname.teamlineup.alignright.size234").children.map{|child| child.text},
      :away_scores_array => days.first.css("td.totalscore.teamlineup").text.strip.split("\n\n "),
      :home_team_array => days.first.css("td.teamname.teamlinedown.alignright.size234").children.map{|child| child.text},
      :home_scores_array => days.first.css("td.totalscore.teamlinedown").text.strip.split("\n\n "),
      :match_status => days.first.css("td.matchstatus.paddingleft.orangeText.hidedownlevel.size123.aligncenter div a").children.map{|child| child.text}
    }
=======
  def scrape_scores
    # returns array of team names
    # and array of scores
    # and link to game info URL
  end

  def scrape_game_info
    # returns hash with:
    # box score array
    # top performers array
    # venue
>>>>>>> nba_date_functionality
  end

end
