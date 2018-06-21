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

  # def show_trip_map(user, x_dest, y_dest)
  #   trip_map = Array.new(@@size) {Array.new(@@size, ".")}
  #   trip_map[user.y_coordinate][user.x_coordinate] = "U"
  #   trip_map[y_dest][y_dest] = "X"
  #
  #   if y_dest > user.y_coordinate
  #     trip_map[(user.y_coordinate + 1)..y_dest][user.x_coordinate] = "|"
  #   else
  #     trip_map[(y_dest - 1)..user.y_coordinate][user.x_coordinate] = "|"
  #   end
  #
  #   if x_dest > user.x_coordinate
  #     trip_map[y_dest][(user.x_coordinate + 1)..x_dest] = "-"
  #   else
  #     trip_map[y_dest][(x_dest - 1)..user.x_coordinate] = "-"
  #   end
  #
  #   trip_map.each do |x|
  #     print(*x)
  #     puts
  #   end
  # end

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