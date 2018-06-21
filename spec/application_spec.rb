require '../lib/application'
require '../lib/maps'
require 'rspec'

RSpec.describe Application do
  describe "#initialize" do
    it "running go-cli without any parameters" do
      app = Application.new
      expect(Maps.size).to eq(20)
    end
    it "running go-cli and passing three parameters" do
      app = Application.new(25, 1,2)
      expect(Maps.size).to eq(25)
      expect(app.user.x_coordinate).to eq(1)
      expect(app.user.y_coordinate).to eq(2)
    end
    it "passing a filename as go-cli parameter" do
      f = File.open("../command.txt", "r")
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

      expect(Maps.size).to eq(20)
      expect(app.user.x_coordinate).to eq(13)
      expect(app.user.y_coordinate).to eq(13)
      expect(Driver.total).to eq(4)
    end
  end
end