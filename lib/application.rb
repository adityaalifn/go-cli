require_relative 'maps'
require_relative 'people'
require_relative 'driver'
require_relative 'user'

class Application
  attr_reader :maps, :drivers, :user

  def initialize(map_size=20, user_x_coordinate=Random.rand(map_size+1), user_y_coordinate=Random.rand(map_size+1))
    @maps = Maps.new(map_size)

    @drivers = []
    1.upto(5) do
      @drivers << Driver.new(Random.rand(map_size+1), Random.rand(map_size+1))
    end

    @user = User.new(user_x_coordinate, user_y_coordinate)
  end
end