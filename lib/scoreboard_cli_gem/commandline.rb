class CommandLine
  def call
    puts "Hello, Welcome to the Scoreboard CLI Gem!"
    puts "Type in your favorite sport for todays scores:"
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
      when "NBA"
        today = Day.new("20170402")
        today.add_match_by_hash(Scraper.scrape_nba("20170402"))

        today.show_scores
        puts ""
        puts "Type in your favorite sport for todays scores:"
        puts "- NFL"
        puts "- NBA"
        puts "- NHL"
        puts "- MLB"
        puts "-----------------------------------------------"
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
