require 'singleton'

class Order
  include Singleton
  UNIT_COST = 300

  # def initialize
    
  # end

  def order_go_ride(drivers, user, x_dest, y_dest)
    driver, driver_to_user_distance = find_nearest_driver(drivers, user)
    trip_distance = count_distance(x_dest, y_dest, user.x_coordinate, user.y_coordinate)
    price = count_price(user, trip_distance)
    puts "Congratulations! We managed to find you a driver."
    puts "Your driver, #{driver.name}, is #{driver_to_user_distance} unit of distance away."
    puts
    puts "Your trip distance is #{trip_distance} unit of distance and your travel cost expenses are #{price}."
  end

  private
  def count_price(user, trip_distance)
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