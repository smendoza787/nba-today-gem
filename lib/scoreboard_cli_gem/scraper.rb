require 'Date'
require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './game.rb'
require_relative './team.rb'
require_relative './player.rb'

class Scraper
  attr_accessor :league, :doc

  def initialize(league)
    @league = league
    @games = []

    @doc = Nokogiri::HTML(open("https://www.msn.com/en-us/sports/#{@league}/scores")).css("div.sectionsgroup ##{Date.today.prev_day.to_s.gsub("-","")}")
  end

  def games
    @games
  end

  def scrape_mlb_scores
    #returned array of mlb game objects with links to game info URL, home and away teams with scores

    Game.all.map{ |game| game.league("mlb") }
  end

  def scrape_mlb_game_info
    # returns hash with:
    # box score array
    # top performers array
    # venue
  end

  def scrape_nhl_scores
    #returned array of nhl game objects with links to game info URL, home and away teams with scores

    Game.all.map{ |game| game.league(self.league) }
  end

  def scrape_nhl_game_info
    # returns hash with:
    # box score array
    # top performers array
    # venue
  end

  def scrape_nfl_scores
    #returned array of nfl game objects with links to game info URL, home and away teams with scores

    Game.all.map{ |game| game.league(self.league) }
  end

  def scrape_nfl_game_info
    # returns hash with:
    # box score array
    # top performers array
    # venue
  end

  def scrape_nba_scores
    # returned array of nba game objects with links to game info URL, home and away teams with scores
    self.doc.css("table tbody").each do |game|
      new_nba_game = Game.new("nba")

      new_nba_game.status = game.css("td.matchstatus.orangeText.hidedownlevel.size4.alignleft div").text
      new_nba_game.venue = game.css("td.venue.size4").text
      new_nba_game.url = "https://www.msn.com/#{game.attribute("data-link").value}"


      new_nba_game.away_team = Team.new(game.css("td.teamname.teamlineup.alignright.size234").text, "nba")
      new_nba_game.away_team.score[0] = game.css("td.totalscore.teamlineup").text.gsub(/[\n _]/, "") # Total score
      new_nba_game.away_team.score[1] = game.css("tr:nth-child(1) td:nth-child(7)").text.gsub(/[\n _]/, "") # Quarter 1 score
      new_nba_game.away_team.score[2] = game.css("tr:nth-child(1) td:nth-child(8)").text.gsub(/[\n _]/, "") # Quarter 2 score
      new_nba_game.away_team.score[3] = game.css("tr:nth-child(1) td:nth-child(9)").text.gsub(/[\n _]/, "") # Quarter 3 score
      new_nba_game.away_team.score[4] = game.css("tr:nth-child(1) td:nth-child(10)").text.gsub(/[\n _]/, "") # Quarter 4 score

      new_nba_game.home_team = Team.new(game.css("td.teamname.teamlinedown.alignright.size234").text, "nba")
      new_nba_game.home_team.score[0] = game.css("td.totalscore.teamlinedown").text.gsub(/[\n _]/, "") # Total score
      new_nba_game.home_team.score[1] = game.css("tr:nth-child(2) td:nth-child(5)").text.gsub(/[\n _]/, "") # Quarter 1 score
      new_nba_game.home_team.score[2] = game.css("tr:nth-child(2) td:nth-child(6)").text.gsub(/[\n _]/, "") # Quarter 2 score
      new_nba_game.home_team.score[3] = game.css("tr:nth-child(2) td:nth-child(7)").text.gsub(/[\n _]/, "") # Quarter 3 score
      new_nba_game.home_team.score[4] = game.css("tr:nth-child(2) td:nth-child(8)").text.gsub(/[\n _]/, "") # Quarter 4 score

      scrape_nba_top_performers(new_nba_game)

      self.games << new_nba_game
    end
    binding.pry
    self.games
  end

  def scrape_nba_top_performers(game)
    get_top_players = Nokogiri::HTML(open(game.url)).css("div.leaders")

    point_leaders = [
      NbaPlayer.new(get_top_players.css("div.points a:nth-child(3) div div.board span div.playername span").text),
      NbaPlayer.new(get_top_players.css("div.points a:nth-child(5) div div.board span div.playername span").text)
    ]

    point_leaders[0].points = get_top_players.css("div.points a:nth-child(3) div div.board span div.stats span").text
    point_leaders[1].points = get_top_players.css("div.points a:nth-child(5) div div.board span div.stats span").text

    rebound_leaders = [
      NbaPlayer.new(get_top_players.css("div.rebounds a:nth-child(3) div div.board span div.playername span").text),
      NbaPlayer.new(get_top_players.css("div.rebounds a:nth-child(5) div div.board span div.playername span").text)
    ]

    rebound_leaders[0].rebounds = get_top_players.css("div.rebounds a:nth-child(3) div div.board span div.stats span").text
    rebound_leaders[1].rebounds = get_top_players.css("div.rebounds a:nth-child(5) div div.board span div.stats span").text

    assist_leaders = [
      NbaPlayer.new(get_top_players.css("div.assists a:nth-child(3) div div.board span div.playername span").text),
      NbaPlayer.new(get_top_players.css("div.assists a:nth-child(5) div div.board span div.playername span").text)
    ]

    assist_leaders[0].assists = get_top_players.css("div.assists a:nth-child(3) div div.board span div.stats span").text
    assist_leaders[1].assists = get_top_players.css("div.assists a:nth-child(5) div div.board span div.stats span").text

    game.top_peformers[:points] = point_leaders
    game.top_peformers[:rebounds] = rebound_leaders
    game.top_peformers[:assists] = assist_leaders

  end
end

Scraper.new("nba").scrape_nba_scores
