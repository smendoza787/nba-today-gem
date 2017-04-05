require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_nba(date = Time.now.strftime("%Y%m%d"))
    nba_msn_sports = Nokogiri::HTML(open('https://www.msn.com/en-us/sports/nba/scores'))


    days = nba_msn_sports.css("div.dataContainer div.autorefreshBox div.sectionsgroup div.section")
    the_day = days.detect{ |day| day.attribute("id").value == date }

    {
      :away_team_array => the_day.css("td.teamname.teamlineup.alignright.size234").children.map{|child| child.text},
      :away_scores_array => the_day.css("td.totalscore.teamlineup").text.strip.split("\n\n "),
      :home_team_array => the_day.css("td.teamname.teamlinedown.alignright.size234").children.map{|child| child.text},
      :home_scores_array => the_day.css("td.totalscore.teamlinedown").text.strip.split("\n\n ")
    }



    # away_team = today.css("td.teamname.teamlineup.alignright.size234").text
    # away_score = today.css("td.totalscore.teamlineup").text.strip
    # home_team = today.css("td.teamname.teamlinedown.alignright.size234").text
    # home_score = today.css("td.totalscore.teamlineudown").text.strip
  end

end


poop = Scraper.scrape_nba("20170402")
binding.pry
