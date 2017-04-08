class Team
  attr_accessor :name, :score, :league

  def initialize(name, league)
    @name = name
    @league = league

    # score is equal to an array of innings/periods/quarters
    # the first element (@score[0]) is the TOTAL/FINAL score
    # subsequent elements are the inning/period/quarter totals
    case @league
    when "mlb"
      @score = [0,0,0,0,0,0,0,0,0,0]
    when "nhl"
      @score = [0,0,0,0]
    else
      @score = [0,0,0,0,0]
    end
  end
end
