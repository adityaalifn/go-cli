class Maps
  attr_reader :size
  attr_accessor :map_contents

  def initialize(size)
    @map_contents = Array.new(size) { Array.new(size, 0)}
    @size = size
  end
end