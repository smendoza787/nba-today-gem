class Team
  attr_accessor :name, :location

  def initialize(name)
    @name = name
  end

  def say_full_name
    "#{location} #{name}"
  end
end
