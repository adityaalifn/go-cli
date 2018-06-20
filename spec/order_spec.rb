require '../lib/order'
require 'rspec'

RSpec.describe Order do
  describe "#find_nearest_driver" do
    order = Order.new
    driver = Driver.new
    
    it "return nearest driver position and the distance from user" do
      driver = order.find_nearest_driver(2, 2)
    end
  end
  describe "#order_go_ride" do
    it "return price" do
      price = order.order_go_ride(1,2)
    end
  end
end