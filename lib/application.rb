require_relative 'maps'
require_relative 'people'
require_relative 'driver'
require_relative 'user'

require 'singleton'

class Application
  include Singleton
  
  attr_reader :maps, :drivers, :user

  def initialize(map_size=20, user_x_coordinate=Random.rand(20), user_y_coordinate=Random.rand(20))
    @maps = Maps.new(map_size)

    # initialize random driver position and user position
    @user = User.new(user_x_coordinate, user_y_coordinate)
    @maps.update_map(user_x_coordinate,user_y_coordinate,"U")
    @drivers = []
    1.upto(5) do |i|
      x = Random.rand(map_size)
      y = Random.rand(map_size)
      @drivers << Driver.new(x, y, "Driver #{i}")
      @maps.update_map(x,y,"D")
    end
  end

  def run
    while true
      # Gem.win_platform? ? (system "cls") : (system "clear")
      puts "========== WELCOME TO GO-CLI MAIN MENU =========="
      puts "1. Show Map"
      puts "2. Order Go Ride"
      puts "3. View History"
      puts "4. Exit"
      print("Select: ")
      selected = gets.chomp
      case selected
      when "1"
        @maps.show_map(@user, @drivers)
      when "2"

      when "3"

      when "4"
        break
      else
        puts "Menu not available."
      end
      puts "Press enter key to continue..."
      gets
    end
  end
end