class Score
  attr_accessor :board

  def initialize(league)

    # score.board is equal to an array of 'periods'
    # the first element (score.board[0]) is the TOTAL/FINAL score
    # subsequent elements are the innings/periods/quarters
    case league
    when "MLB"
      self.board = [0,0,0,0,0,0,0,0,0,0]
    when "NHL"
      self.board = [0,0,0,0]
    else
      self.board = [0,0,0,0,0]
    end
  end
end
