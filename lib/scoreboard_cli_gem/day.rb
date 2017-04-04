require 'Date'

class Day
  attr_accessor :date

  def initialize(date = Time.now.strftime("%Y%m%d"))
    @date = date
    @matches = []
  end

  def matches
    @matches
  end

  def show_date
    Date.parse(self.date).strftime("%B %d, %Y")
  end

  def add_match(match)
    self.matches << match
  end
end
