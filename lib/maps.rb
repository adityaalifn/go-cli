class Maps
  "" "
  Class consist of map with it's contents.
  " ""
  attr_accessor :map_contents

  def initialize(size)
    @@size = size
    @map_contents = Array.new(@@size) {Array.new(@@size, ".")}
  end

  def update_map(x, y, type)
    # x, y is coordinate of people
    # type consist of driver ("D") and user ("U")
    @map_contents[y - 1][x - 1] = type
  end

  def show_map(user, drivers)
    "" "
    Showing user and drivers current position.
    " ""
    @map_contents.each do |x|
      print(*x)
      puts
    end
  end

  def is_map_size_valid?(x_dest, y_dest)
    "" "
    Check whether user can go to the destination or not.
    " ""
    @@size < x_dest.to_i or @@size < y_dest.to_i ? true : false
  end

  def self.size
    @@size
  end
end