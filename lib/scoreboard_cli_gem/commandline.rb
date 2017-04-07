class CommandLine
  def call
    puts "Hello, Welcome to the Scoreboard CLI Gem!"
    puts "Type in your favorite sport for the latest scores:"
    puts "- NFL"
    puts "- NBA"
    puts "- NHL"
    puts "- MLB"
    puts "-----------------------------------------------"
    print "> "
    input = gets.strip.upcase

    until input == "EXIT"
      case input
      when "NFL"
        puts ""
        puts "Here are the scores for the latest NFL games:"
        puts ""
        puts "---------------------------------------------"
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
      when "NHL"
      when "MLB"
      else
        puts "Please choose a sport from the list!"
        print "> "
        input = gets.strip.upcase
      end
    end

    puts "Thanks for checking the ScoreBoard!"
  end
end
