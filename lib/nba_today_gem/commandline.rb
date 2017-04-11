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
      puts
      puts "Type in 'nba today' for the latest NBA scores"
      puts "or type 'exit' to quit!"
      puts
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

      header :title => 'NBA SCORES', :width => 75, :align => 'center', :rule => true, :color => 'green', :bold => true, :timestamp => true

      self.games.each.with_index(1) do |game, index|
        table(:border => true) do
          row do
            column('GAME NUM.', :width => 10, :align => 'center')
            column(game.date, :width => 30, :align => 'center')
            column('SCORE', :width => 10, :align => 'center')
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
      header :title => 'NBA SCORES', :width => 50, :align => 'center', :rule => true, :color => 'green', :bold => true, :timestamp => true

      self.games.each.with_index(1) do |game, index|
        table(:border => true) do
          row do
            column('GAME NUM.', :width => 5)
            column(game.date, :width => 30, :align => 'center')
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

    until game_no == 'back' || game_no == 'exit'
      puts
      puts "Type in a GAME NUM. to view more stats and info"
      puts "Type 'list games' for a list of games"
      puts "Type 'back' to go back to the main menu."
      puts
      print "> "
      game_no = gets.strip.downcase

      if game_no == "list games"
        list_games
        pick_game_menu
      elsif game_no.to_i > 0 && game_no.to_i <= self.games.length
        index = game_no.to_i - 1
        show_game(index)
      end
    end
  end

  def show_game(index)
    table(:border => true) do
      row do
        column(self.games[index].date, :width => 30, :align => 'center')
        column(self.games[index].venue, :width => 55, :align => 'center')
      end
    end

    puts

    if self.games[index].recap != ""
      table(:border => true) do
        row do
          column(self.games[index].recap, :width => 80, :align => 'center')
        end
      end

      puts
    end

    header :title => 'BOX SCORE', :width => 100, :align => 'center', :rule => true, :color => 'red', :bold => true

    table(:border => true) do
      row do
        column('TEAM', :width => 25, :align => 'center')
        column('QTR 1', :width => 9, :align => 'center')
        column('QTR 2', :width => 9, :align => 'center')
        column('QTR 3', :width => 9, :align => 'center')
        column('QTR 4', :width => 9, :align => 'center')
        column(self.games[index].status, :align => 'center')
      end
      row do
        column(self.games[index].away_team.name)
        column(self.games[index].away_team.score[1])
        column(self.games[index].away_team.score[2])
        column(self.games[index].away_team.score[3])
        column(self.games[index].away_team.score[4])
        column(self.games[index].away_team.score[0])
      end
      row do
        column(self.games[index].home_team.name)
        column(self.games[index].home_team.score[1])
        column(self.games[index].home_team.score[2])
        column(self.games[index].home_team.score[3])
        column(self.games[index].home_team.score[4])
        column(self.games[index].home_team.score[0])
      end
    end

    puts
    header :title => 'TOP PERFORMERS', :width => 100, :align => 'center', :rule => true, :color => 'green', :bold => true

    table(:border => true) do
      row do
        column("#{self.games[index].away_team.name}", :width => 35, :align => 'center')
        column('', :align => 'center')
        column("#{self.games[index].home_team.name}", :width => 35, :align => 'center')
      end
      row do
        column("#{self.games[index].top_peformers[:points][0].name}: #{self.games[index].top_peformers[:points][0].points}", :width => 35, :align => 'center')
        column('POINTS', :align => 'center')
        column("#{self.games[index].top_peformers[:points][1].name}: #{self.games[index].top_peformers[:points][1].points}", :width => 35, :align => 'center')
      end
      row do
        column("#{self.games[index].top_peformers[:rebounds][0].name}: #{self.games[index].top_peformers[:rebounds][0].rebounds}", :width => 35, :align => 'center')
        column('REBOUNDS', :align => 'center')
        column("#{self.games[index].top_peformers[:rebounds][1].name}: #{self.games[index].top_peformers[:rebounds][1].rebounds}", :width => 35, :align => 'center')
      end
      row do
        column("#{self.games[index].top_peformers[:assists][0].name}: #{self.games[index].top_peformers[:assists][0].assists}", :width => 35, :align => 'center')
        column('ASSISTS', :align => 'center')
        column("#{self.games[index].top_peformers[:assists][1].name}: #{self.games[index].top_peformers[:assists][1].assists}", :width => 35, :align => 'center')
      end
    end
  end

  def goodbye
    puts "Thanks for using the NBA Today Gem!"
  end
end
