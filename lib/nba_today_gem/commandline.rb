class NbaTodayGem::CommandLine
  include CommandLineReporter

  attr_reader :games

  def call
    puts "Hello, Welcome to the NBA Today Gem!"
    menu
    goodbye
  end

  def menu
    input = nil

    until input == "exit"
      puts "Type in 'nba today' for the latest NBA scores or type 'exit' to quit!"
      print "> "
      input = gets.strip.downcase

      if input == "nba today"
        list_games
        pick_game_menu
      end
    end
  end

  def list_games
    if !self.games
      @games = NbaTodayGem::Scraper.new.scrape_nba_scores

      self.games.each.with_index(1) do |game, index|
        table(:border => true) do
          row do
            column('GAME NO.', :width => 5)
            column('TEAM', :width => 30, :align => 'center')
            column('SCORE', :width => 10, :align => 'right')
          end
          row do
            column(index)
            column(game.away_team.name)
            column(game.away_team.score[0])
          end
          row do
            column('')
            column(game.home_team.name)
            column(game.home_team.score[0])
          end
        end
      end
    else
      self.games.each.with_index(1) do |game, index|
        table(:border => true) do
          row do
            column('GAME NO.', :width => 5)
            column('TEAM', :width => 30, :align => 'center')
            column('SCORE', :width => 10, :align => 'right')
          end
          row do
            column(index)
            column(game.away_team.name)
            column(game.away_team.score[0])
          end
          row do
            column('')
            column(game.home_team.name)
            column(game.home_team.score[0])
          end
        end
      end
    end
  end

  def pick_game_menu
    game_no = nil

    until game_no == 'back'
      puts "Choose a GAME NO. to view more stats and info or type 'list games' for a list of games"
      puts "or type 'back' to go back to the main menu."
      print "> "
      game_no = gets.strip.downcase

      if game_no == "list games"
        list_games
        pick_game_menu
      elsif game_no.to_i > 0 && game_no.to_i <= self.games.length
        index = game_no.to_i - 1
        puts self.games[index]
      end
    end
  end

  def goodbye
    puts "Thanks for using the NBA Today Gem!"
  end
end
