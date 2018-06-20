class People
  attr_accessor :x_coordinate, :y_coordinate

  def initialize(x_coordinate=Random.rand(Maps.size), y_coordinate=Random.rand(Maps.size))
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end
end