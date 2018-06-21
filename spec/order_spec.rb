require 'rspec'
require '../lib/order'
require '../lib/maps'
require '../lib/people'
require '../lib/user'
require '../lib/driver'

RSpec.describe Order do
  before(:each) do
    @order = Order.instance
    @map = Maps.new(20)
    @drivers = []
    @drivers << Driver.new
    @drivers << Driver.new
    @user = User.new(0,0)
  end
  describe "#find_nearest_driver" do
    it "return nearest driver position and the distance from user" do
      driver, distance = @order.send(:find_nearest_driver, @drivers, @user)
      @drivers.delete(driver)
      distance_another_driver = @order.send(:count_distance, @user.x_coordinate, @user.y_coordinate, @drivers[0].x_coordinate, @drivers[0].y_coordinate)
      cond = distance_another_driver > distance
      expect(cond).to eq(true)
    end
  end
  describe "#count_price" do
    it "return trip distance times UNIT_COST = 300" do
      distance = 30
      price = @order.send(:count_price, distance)
      expect(price).to eq(9000)
    end
  end
  # describe "#order_go_ride" do
  #   it "return all confirmation" do
  #
  #   end
  # end
end