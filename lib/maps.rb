class Maps
  attr_reader :length, :width
  attr_accessor :map_contents

  def initialize(length, width)
    @map_contents = Array.new(width) { Array.new(length, 0)}
    @length = length
    @width = width
  end
end