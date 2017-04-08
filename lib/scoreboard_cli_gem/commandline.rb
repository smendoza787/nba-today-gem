class CommandLine
  def call
    puts "----------------------------------------------------"
    puts "Hello, Welcome to the Scoreboard CLI Gem!           |"
    puts "Type in your favorite sport for the latest scores:  |"
    puts "- NFL                                               |"
    puts "- NBA                                               |"
    puts "- NHL                                               |"
    puts "- MLB                                               |"
    puts "----------------------------------------------------"
    print "> "
    puts "Hello, Welcome to the ScoreBoard CLI Gem!"
    menu
    puts "Thanks for checking the ScoreBoard!"
  end

  def menu
    list_sports
    input = gets.strip.upcase

    until input == "EXIT"
      case input
      when "NFL"
      when "NBA"
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
