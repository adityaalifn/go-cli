require '../lib/application'

RSpec.describe Application do
  describe "#initialize" do
    it "running go-cli without any parameters" do
      app = Application.new
      expect(Driver.total).to eq(5)
      expect(app.maps.length).to eq(20)
      expect(app.maps.width).to eq(20)
    end
    it "running go-cli and passing three parameters" do

    end
    it "passing a filename as go-cli parameter" do

    end
  end
end