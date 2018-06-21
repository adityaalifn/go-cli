class Maps
  attr_accessor :map_contents

  def initialize(size)
    @@size = size
    @map_contents = Array.new(@@size) { Array.new(@@size, ".")}
  end

  def update_map(x, y, type)
    # x, y is coordinate of people
    # type consist of driver ("D") and user ("U")
    @map_contents[y-1][x-1] = type
  end

  def show_map(user, drivers)
    @map_contents.each do |x|
      print(*x)
      puts
    end
  end

  def is_map_size_valid?(x_dest, y_dest)
    @@size < x_dest or @@size < y_dest ? true : false
  end

  def self.size
    @@size
  end
end