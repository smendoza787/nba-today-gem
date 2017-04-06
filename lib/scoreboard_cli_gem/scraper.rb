class Scraper

  def self.scrape_nba(date = Time.now.strftime("%Y%m%d"))
    # We need to go to the url of the NEXT day on MSN Sports, to get the scores
    # of the actual day we want for some reason
    weird_url_date = Date.parse(date).next_day.strftime("%Y%m%d")
    new_url = 'https://www.msn.com/en-us/sports/nba/scores/sp-d-' + weird_url_date


    nba_msn_sports = Nokogiri::HTML(open(new_url))


    days = nba_msn_sports.css("div.dataContainer div.autorefreshBox div.sectionsgroup div.section")
    matching_day = days.detect{ |day| day.attribute("id").value == date }


    {
      :away_team_array => days.first.css("td.teamname.teamlineup.alignright.size234").children.map{|child| child.text},
      :away_scores_array => days.first.css("td.totalscore.teamlineup").text.strip.split("\n\n "),
      :home_team_array => days.first.css("td.teamname.teamlinedown.alignright.size234").children.map{|child| child.text},
      :home_scores_array => days.first.css("td.totalscore.teamlinedown").text.strip.split("\n\n ")
    }
  end

end
