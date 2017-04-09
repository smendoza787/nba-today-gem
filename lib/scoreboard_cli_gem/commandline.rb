class CommandLine
  include CommandLineReporter

  def call
    puts "Hello, Welcome to the NBA Today Gem!"
    puts "Type in 'nba today' for the latest NBA scores or type 'exit' to quit!"
    print "> "
    menu
    puts "Thanks for using the NBA Today Gem!"
  end

  def menu
    input = gets.strip.downcase

    until input == "exit"
      case input
      when "nba today"
        show_games_table
        pick_game_menu
      else
        puts "Please type in 'nba today' or 'exit'!"
        print "> "
        input = gets.strip.downcase
      end
    end
  end

  def show_games_table
    games = Scraper.new.scrape_nba_scores

    games.each_with_index do |game, index|
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

  def pick_game_menu
    puts "Choose a GAME NO. to view more stats and info"

    print "> "
    input = gets.strip


  end
end
