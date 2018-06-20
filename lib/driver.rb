class Driver < People
  @@total = 0
  attr_reader :name
  def initialize(x, y, name)
    super(x, y)
    @@total += 1
    @name = name
  end

  def self.total
    @@total
  end
end