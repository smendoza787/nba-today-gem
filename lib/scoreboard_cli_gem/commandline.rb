class CommandLine
  def call
<<<<<<< HEAD
    puts "----------------------------------------------------"
    puts "Hello, Welcome to the Scoreboard CLI Gem!           |"
    puts "Type in your favorite sport for the latest scores:  |"
    puts "- NFL                                               |"
    puts "- NBA                                               |"
    puts "- NHL                                               |"
    puts "- MLB                                               |"
    puts "----------------------------------------------------"
    print "> "
=======
    puts "Hello, Welcome to the ScoreBoard CLI Gem!"
    menu
    puts "Thanks for checking the ScoreBoard!"
  end

  def menu
    list_sports
>>>>>>> nba_date_functionality
    input = gets.strip.upcase

    until input == "EXIT"
      case input
      when "NFL"
        puts "Here are the scores for the latest NFL games:"
        puts "---------------------------------------------"
        puts ""
        puts "Sunday, February 5 2017"
        puts ""
        puts "Patriots : 34"
        puts "Falcons : 28"
        puts "Final"
        puts ""
        puts "---------------------------------------------"
        puts ""

        puts "Type in your favorite sport for the latest scores:"
        print "> "
        input = gets.strip.upcase
      when "NBA"
<<<<<<< HEAD
        puts ""
        today = Day.new
        today.add_match_by_hash(Scraper.scrape_nba)

        puts today.show_date
        puts "---------------------------------------------"
        today.show_scores
        puts ""
        puts "---------------------------------------------"
        puts ""

        puts "Type in your favorite sport for the latest scores:"
        print "> "
        input = gets.strip.upcase
=======
        get_nba_games
>>>>>>> nba_date_functionality
      when "NHL"
      when "MLB"
      else
        puts "Please choose a sport from the list!"
        print "> "
        input = gets.strip.upcase
      end
    end
  end

  def list_sports
    puts "Type in your favorite sport for the latest scores:"
    puts "1. NFL"
    puts "2. NBA"
    puts "3. NHL"
    puts "4. MLB"
    puts "---------------------------------------------------"
    puts ""
    print "> "
  end

  def get_nba_games

  end

  def sub_menu(sport)

  end
end
