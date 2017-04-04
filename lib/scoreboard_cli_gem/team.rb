class Team
  attr_accessor :name, :record, :matches

  def initialize(name)
    @name = name
    @matches = []
  end
end
