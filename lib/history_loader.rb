require 'yaml'

module HistoryLoader
  def HistoryLoader.save_history(order_list)
    begin
      history = load_history
    rescue
      history = []
    end
    File.write("order_history.yml", (history+order_list).to_yaml)
  end

  def HistoryLoader.load_history
    begin
      YAML.load_file("order_history.yml")
    rescue
      []
    end
  end
end