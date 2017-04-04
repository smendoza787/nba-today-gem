
  Day
    date defaults to todays date if none is passed
    has a date
    has many matches
  Matches
    belong to a day
    have a home_team with a score
    have an away_team with a score
    has a status of final or 1stQTR/2ndQTR etc
  Teams
    has a name
    has a score
    is_winner?
    ----------------
    Home Team < Team

    Away Team < Team




scoreboard-cli-gem walkthrough
  "Hello, Welcome to the Scoreboard CLI Gem!"
  "Type in your favorite sport for scores:"
  - NFL
  - NBA
  - NHL
  - MLB

  gets = "NBA"
  "Here are the scores for #{day.show_date}"

  @ Target Center, Minneapolis, Minnesota
  Portland Trail Blazers (38-39) : 109
  Minnesota Timberwolves (31-45) : 110
  FINAL


  "If you would like to view a different day of games, please enter a date (YYYMMDD)"
  "or enter the name of a different sport to switch sports:"
  gets = "20170403"
