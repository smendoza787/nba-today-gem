require 'Date'
require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './game.rb'
require_relative './team.rb'

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
      new_nba_game.away_team = Team.new(game.css("td.teamname.teamlineup.alignright.size234").text, "nba")
      new_nba_game.away_team.score[0] = game.css("td.totalscore.teamlineup").text.gsub(/[\n _]/, "") # Total score
      new_nba_game.away_team.score[1] = game.css("tr:nth-child(1) td:nth-child(7)").text.gsub(/[\n _]/, "") # Quarter 1 score
      # new_nba_game.away_team.score[2] =  # Quarter 2 score
      # new_nba_game.away_team.score[3] =  # Quarter 3 score
      # new_nba_game.away_team.score[4] =  # Quarter 4 score

      new_nba_game.home_team = Team.new(game.css("td.teamname.teamlinedown.alignright.size234").text, "nba")
      new_nba_game.home_team.score[0] = game.css("td.totalscore.teamlinedown").text.gsub(/[\n _]/, "") # Total score
      new_nba_game.home_team.score[1] = game.css("tr:nth-child(2) td:nth-child(5)").text.gsub(/[\n _]/, "") # Quarter 1 score
      self.games << new_nba_game
    end
    self.games
    binding.pry
  end

  def scrape_nba_game_info
    # returns hash with:
    # box score array
    # top performers array
    # venue
  end

end

Scraper.new("nba").scrape_nba_scores
