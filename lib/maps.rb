class Maps
  attr_reader :size
  attr_accessor :map_contents

  def initialize(size)
    @map_contents = Array.new(size) { Array.new(size, ".")}
    @size = size
  end

  def show_map
    map_contents.each do |x|
      print(*x)
      puts
    end
  end
end