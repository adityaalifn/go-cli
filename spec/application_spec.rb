require '../lib/application'

RSpec.describe Application do
  describe "#initialize" do
    it "running go-cli without any parameters" do
      app = Application.new
      expect(app.drivers.length).to eq(5)
      expect(app.maps.size).to eq(20)
    end
    it "running go-cli and passing three parameters" do
      app = Application.new(25, 1,2)
      expect(app.drivers.length).to eq(5)
      expect(app.maps.size).to eq(25)
      expect(app.user.x_coordinate).to eq(1)
      expect(app.user.y_coordinate).to eq(2)
    end
    it "passing a filename as go-cli parameter" do
    end
  end
end