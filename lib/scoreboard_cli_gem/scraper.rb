class Scraper

  def self.scrape_nba(date = Time.now.strftime("%Y%m%d"))
    nba_msn_sports = Nokogiri::HTML(open('https://www.msn.com/en-us/sports/nba/scores'))


    days = nba_msn_sports.css("div.dataContainer div.autorefreshBox div.sectionsgroup div.section")
    matching_day = days.detect{ |day| day.attribute("id").value == date }

    {
      :away_team_array => matching_day.css("td.teamname.teamlineup.alignright.size234").children.map{|child| child.text},
      :away_scores_array => matching_day.css("td.totalscore.teamlineup").text.strip.split("\n\n "),
      :home_team_array => matching_day.css("td.teamname.teamlinedown.alignright.size234").children.map{|child| child.text},
      :home_scores_array => matching_day.css("td.totalscore.teamlinedown").text.strip.split("\n\n ")
    }
  end

end
