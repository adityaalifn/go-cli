require_relative 'maps'
require_relative 'people'
require_relative 'driver'
require_relative 'user'

class Application
  attr_reader :maps, :drivers, :user

  def initialize(map_size=20, user_x_coordinate=Random.rand(map_size+1), user_y_coordinate=Random.rand(map_size+1))
    @maps = Maps.new(map_size)

    @drivers = []
    1.upto(5) do |i|
      @drivers << Driver.new(Random.rand(map_size+1), Random.rand(map_size+1), "Driver #{i}")
    end

    @user = User.new(user_x_coordinate, user_y_coordinate)
  end

  def run
    while true
      Gem.win_platform? ? (system "cls") : (system "clear")
      puts "========== WELCOME TO GO-CLI MAIN MENU =========="
      puts "1. Show Map"
      puts "2. Order Go Ride"
      puts "3. View History"
      puts "4. Exit"
      print("Select: ")
      selected = gets.chomp

      case selected
      when "1"
        @maps.show_map
      when "2"

      when "3"

      when "4"
        break
      end
    end
  end
end