require_relative './player.rb'
require_relative './nba_player.rb'

class Game
  attr_accessor :status, :score, :venue, :top_peformers, :league, :home_team, :away_team, :url

  @@all = []

  def initialize(league)
    @league = league
    @top_peformers = []
    @@all << self
  end

  def away_team=(away_team)
    if !away_team.is_a?(Team)
      raise TypeError, "must be a Team object"
    else
      @away_team = away_team
    end
  end

  def home_team=(home_team)
    if !home_team.is_a?(Team)
      raise TypeError, "must be a Team object"
    else
      @home_team = home_team
    end
  end

  def self.all
    @@all
  end

  def get_top_performers
    # will return hash of player objects

    get_top_players = Nokogiri::HTML(open(self.url)).css("div.leaders")

    point_leaders = [
      NbaPlayer.new(get_top_players.css("div.points a:nth-child(3) div div.board span div.playername span").text),
      NbaPlayer.new(get_top_players.css("div.points a:nth-child(5) div div.board span div.playername span").text)
    ]

    rebound_leaders = [
      NbaPlayer.new(get_top_players.css("div.rebounds a:nth-child(3) div div.board span div.playername span").text),
      NbaPlayer.new(get_top_players.css("div.rebounds a:nth-child(5) div div.board span div.playername span").text)
    ]

    assist_leaders = [
      NbaPlayer.new(get_top_players.css("div.assists a:nth-child(3) div div.board span div.playername span").text),
      NbaPlayer.new(get_top_players.css("div.assists a:nth-child(5) div div.board span div.playername span").text)
    ]


    poop = {
      :points => point_leaders,
      :rebounds => rebound_leaders,
      :assists => assist_leaders
    }
    binding.pry
  end

end
