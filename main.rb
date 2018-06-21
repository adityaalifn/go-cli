require_relative 'lib/application'

input_array = ARGV

if input_array.length <= 0
  app = Application.new if input_array.length <= 0
else
  begin
    app = Application.new(input_array[0].to_i, input_array[1].to_i, input_array[2].to_i)
  rescue
    abort("Map size and coordinate must number greater than zero")
  end
end

app.run