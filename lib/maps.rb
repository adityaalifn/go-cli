class Maps
  attr_reader :size
  attr_accessor :map_contents

  def initialize(size)
    @map_contents = Array.new(size) { Array.new(size, ".")}
    @size = size
  end

  def update_map(x, y, type)
    # x, y is coordinate of people
    # type consist of driver ("D") and user ("U")
    @map_contents[x][y] = type
  end

  def show_map(user, drivers)
    @map_contents.each do |x|
      print(*x)
      puts
    end
  end

  def is_map_size_valid?(x_dest, y_dest)
    @size <= x_dest or @size <= y_dest ? true : false
  end
end