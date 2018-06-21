require_relative 'lib/application'

input_array = ARGV

def parse_command_from_file(input_array)
  f = File.open(input_array[0], "r")
  command_list = f.read.split("\n")
  command = command_list.shift
  if command.split[0] == "create_map"
    map_size = command.split[1]

    command = command_list.shift
    if command.split[0] == "user_coordinate"
      if map_size.to_i <= 0 or command.split[1].to_i <= 0 or command.split[2].to_i <= 0
        abort("Map size and coordinate must be number greater than zero.")
      else
        app = Application.new(map_size.to_i, command.split[1].to_i, command.split[2].to_i)
      end
    end
  end
  command_list.each do |line|
    driver = line.split
    abort("Invalid command input.") if driver[0] != "driver"
    abort("Driver coordinate must be number greater than zero.") if driver[2].to_i <= 0 and driver[3].to_i <= 0
    app.drivers << Driver.new(driver[2].to_i, driver[3].to_i, driver[1])
    app.maps.update_map(driver[2].to_i, driver[3].to_i, "D")
  end
  f.close
  app
end

if input_array.length == 0
  app = Application.new if input_array.length <= 0
elsif input_array.length == 1
  app = parse_command_from_file(input_array)
elsif input_array.length == 3
  if input_array[0].to_i <= 0 or input_array[1].to_i <= 0 or input_array[2].to_i <= 0
    abort("Map size and coordinate must be number greater than zero.")
  else
    app = Application.new(input_array[0].to_i, input_array[1].to_i, input_array[2].to_i)
  end
else
  abort ("Invalid number of argument.")
end

app.run
