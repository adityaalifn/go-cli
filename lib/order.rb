require 'singleton'
require_relative 'history_loader'

class Order
  include Singleton
  UNIT_COST = 300
  @@order_history = []

  def order_go_ride(drivers, user, x_dest, y_dest, map)
    driver, driver_to_user_distance = find_nearest_driver(drivers, user)
    trip_distance = count_distance(x_dest, y_dest, user.x_coordinate, user.y_coordinate)
    if trip_distance == 0
      puts "You are already there."
      return
    end
    price = count_price(trip_distance)
    route = driver.show_route(user, x_dest, y_dest)
    puts "Congratulations! We managed to find you a driver."
    puts "Your driver, #{driver.name}, is #{driver_to_user_distance} unit of distance away."
    puts
    puts route
    puts "Your trip distance is #{trip_distance} unit of distance and your travel cost expenses are #{price}."
    print "Do you confirm to order? (y/n): "
    choice = gets.chomp
    until ["y", "n"].include?(choice)
      puts "Invalid option."
      print "Do you confirm to order? (y/n): "
      choice = gets.chomp
    end

    if choice == "y"
      map.update_map(user.x_coordinate, user.y_coordinate, ".")
      user.x_coordinate, user.y_coordinate = x_dest, y_dest
      map.update_map(x_dest, y_dest, "U")

      temp_order = {driver_name:driver.name, route:route, price:price, datetime: Time.new.inspect}
      @@order_history << temp_order
      HistoryLoader.save_history(@@order_history)
    else
      
    end
  end

  private
  def count_price(trip_distance)
    UNIT_COST * trip_distance
  end

  def find_nearest_driver(drivers, user)
    nearest = drivers[0]
    distance = count_distance(nearest.x_coordinate, nearest.y_coordinate, user.x_coordinate, user.y_coordinate)

    for i in 1...drivers.length
      new_distance = count_distance(drivers[i].x_coordinate, drivers[i].y_coordinate, user.x_coordinate, user.y_coordinate)
      if new_distance < distance
        nearest = drivers[i]
        distance = new_distance
      end
    end

    return nearest, distance
  end

  def count_distance(x_user, y_user, x_driver, y_driver)
    (x_driver - x_user).abs + (y_driver - y_user).abs
  end
end