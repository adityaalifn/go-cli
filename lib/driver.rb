class Driver < People
  @@total = 0
  def initialize(x, y)
    super(x, y)
    @@total += 1
  end

  def self.total
    @@total
  end
end