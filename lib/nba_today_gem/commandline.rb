class NbaTodayGem::CommandLine
  include CommandLineReporter

  #attr_reader :games

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
    if NbaTodayGem::Game.all.size == 0
      NbaTodayGem::Scraper.new.scrape_nba_scores

      header :title => 'NBA SCORES', :width => 75, :align => 'center', :rule => true, :color => 'green', :bold => true, :timestamp => true

      NbaTodayGem::Game.all.each.with_index(1) do |game, index|
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

      NbaTodayGem::Game.all.each.with_index(1) do |game, index|
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
      elsif game_no.to_i > 0 && game_no.to_i <= NbaTodayGem::Game.all.length
        index = game_no.to_i - 1
        game = NbaTodayGem::Game.find(index)
        NbaTodayGem::Scraper.scrape_nba_game_info(game)
        show_game(index)
      end
    end
  end

  def show_game(index)
    table(:border => true) do
      row do
        column(NbaTodayGem::Game.all[index].date, :width => 30, :align => 'center')
        column(NbaTodayGem::Game.all[index].venue, :width => 55, :align => 'center')
      end
    end

    puts

    if NbaTodayGem::Game.all[index].recap != ""
      table(:border => true) do
        row do
          column(NbaTodayGem::Game.all[index].recap, :width => 80, :align => 'center')
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
        column(NbaTodayGem::Game.all[index].status, :align => 'center')
      end
      row do
        column(NbaTodayGem::Game.all[index].away_team.name)
        column(NbaTodayGem::Game.all[index].away_team.score[1])
        column(NbaTodayGem::Game.all[index].away_team.score[2])
        column(NbaTodayGem::Game.all[index].away_team.score[3])
        column(NbaTodayGem::Game.all[index].away_team.score[4])
        column(NbaTodayGem::Game.all[index].away_team.score[0])
      end
      row do
        column(NbaTodayGem::Game.all[index].home_team.name)
        column(NbaTodayGem::Game.all[index].home_team.score[1])
        column(NbaTodayGem::Game.all[index].home_team.score[2])
        column(NbaTodayGem::Game.all[index].home_team.score[3])
        column(NbaTodayGem::Game.all[index].home_team.score[4])
        column(NbaTodayGem::Game.all[index].home_team.score[0])
      end
    end

    puts
    header :title => 'TOP PERFORMERS', :width => 100, :align => 'center', :rule => true, :color => 'green', :bold => true

    table(:border => true) do
      row do
        column("#{NbaTodayGem::Game.all[index].away_team.name}", :width => 35, :align => 'center')
        column('', :align => 'center')
        column("#{NbaTodayGem::Game.all[index].home_team.name}", :width => 35, :align => 'center')
      end
      row do
        column("#{NbaTodayGem::Game.all[index].top_peformers[:points][0].name}: #{NbaTodayGem::Game.all[index].top_peformers[:points][0].points}", :width => 35, :align => 'center')
        column('POINTS', :align => 'center')
        column("#{NbaTodayGem::Game.all[index].top_peformers[:points][1].name}: #{NbaTodayGem::Game.all[index].top_peformers[:points][1].points}", :width => 35, :align => 'center')
      end
      row do
        column("#{NbaTodayGem::Game.all[index].top_peformers[:rebounds][0].name}: #{NbaTodayGem::Game.all[index].top_peformers[:rebounds][0].rebounds}", :width => 35, :align => 'center')
        column('REBOUNDS', :align => 'center')
        column("#{NbaTodayGem::Game.all[index].top_peformers[:rebounds][1].name}: #{NbaTodayGem::Game.all[index].top_peformers[:rebounds][1].rebounds}", :width => 35, :align => 'center')
      end
      row do
        column("#{NbaTodayGem::Game.all[index].top_peformers[:assists][0].name}: #{NbaTodayGem::Game.all[index].top_peformers[:assists][0].assists}", :width => 35, :align => 'center')
        column('ASSISTS', :align => 'center')
        column("#{NbaTodayGem::Game.all[index].top_peformers[:assists][1].name}: #{NbaTodayGem::Game.all[index].top_peformers[:assists][1].assists}", :width => 35, :align => 'center')
      end
    end
  end

  def goodbye
    puts "Thanks for using the NBA Today Gem!"
  end
end
