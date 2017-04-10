class NbaTodayGem::Team
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = [0,0,0,0,0]
  end
end
