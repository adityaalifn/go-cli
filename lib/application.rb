require_relative 'maps'
require_relative 'people'
require_relative 'driver'
require_relative 'user'
require_relative 'order'

class Application
  attr_reader :maps, :drivers, :user

  def initialize(map_size=20, user_x_coordinate=Random.rand(20), user_y_coordinate=Random.rand(20))
    @maps = Maps.new(map_size)

    # initialize random driver position and user position
    @user = User.new(user_x_coordinate, user_y_coordinate)
    @maps.update_map(user_x_coordinate,user_y_coordinate,"U")
    @drivers = []
    1.upto(5) do
      driver = Driver.new
      @drivers << driver
      puts driver.x_coordinate
      @maps.update_map(driver.x_coordinate, driver.y_coordinate, "D")
    end
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
      parse_menu(selected)
    end
  end

  private
  def parse_menu(select)
    case select
    when "1"
      @maps.show_map(@user, @drivers)
    when "2"
      print "Input your destination (x and y split by space): "
      coordinate = gets.chomp.split(" ").map {|i| i.to_i}
      while coordinate.length != 2 or @maps.is_map_size_valid?(coordinate[0], coordinate[1]) or (coordinate[0] <= 0 or coordinate[1].to_i <= 0)
        puts "Invalid input." if coordinate.length != 2
        puts "Destination out of range." if @maps.is_map_size_valid?(coordinate[0], coordinate[1].to_i)
        puts "Destination must be two number greater than zero." if coordinate[0] <= 0 or coordinate[1].to_i <= 0

        print "Input your destination (x and y split by space): "
        coordinate = gets.chomp.split(" ").map {|i| i.to_i}
      end
      order = Order.instance
      order.order_go_ride(@drivers, @user, coordinate[0], coordinate[1], @maps)
    when "3"

    when "4"
      abort("Thanks for using GO-CLI!")
    else
      puts "Menu not available."
    end
    puts "Press enter key to continue..."
    gets
  end
end