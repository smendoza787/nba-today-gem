class CommandLine
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
        latest_scores = Scraper.new.scrape_nba_scores
        binding.pry
      else
        puts "Please type in 'nba today' or 'exit'!"
        print "> "
        input = gets.strip.downcase
      end
    end
  end
end
