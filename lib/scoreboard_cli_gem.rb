require 'require_all'
require_all 'lib'

module ScoreboardCliGem
  puts "Hello, Welcome to the Scoreboard CLI Gem!"
  puts "Type in your favorite sport for todays scores:"
  puts "- NFL"
  puts "- NBA"
  puts "- NHL"
  puts "- MLB"
  puts "-----------------------------------------------"
  print "> "
  input = gets.strip.upcase

  until input == "NFL" || input == "NBA" || input == "NHL" || input == "MLB"
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
