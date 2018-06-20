require '../lib/order'
require 'rspec'

RSpec.describe Order do
  describe "#find_driver" do
    order = Order.new
    it "return nearest driver position" do
      driver = order.find_driver(1, 2)
    end
  end
  describe "#order_go_ride" do
    it "return price" do
      price = order.order_go_ride(1,2)
    end
  end
end