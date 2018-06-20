require_relative 'maps'
require_relative 'people'
require_relative 'driver'

class Application
  attr_reader :maps

  def initialize(map_length=20, map_width=20, number_of_driver=5)
    @maps = Maps.new(map_length, map_width)

    @drivers = []
    1.upto(number_of_driver) do
      @drivers << Driver.new(Random.rand(map_length), Random.rand(map_width))
    end
  end
end