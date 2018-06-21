class Driver < People
  @@total = 0
  @@driver_name_list = ["Adimul", "Bento", "Paijo", "Sukirman", "Mbok Darmi", "Uvuvwevwevwe Onyetenvewve Ugwemubwem Ossas", "Jholeasuna Lapuslamarekanaujbck Ugwemubwem Osassla"].shuffle
  attr_reader :name

  def initialize(x=Random.rand(Maps.size+1),y=Random.rand(Maps.size+1),name=nil)
    super(x,y)
    @@total += 1
    @name = name
    @name = @@driver_name_list.shift if name.nil?
  end

  def self.total
    @@total
  end

  def show_route(user, x_dest, y_dest)
    turn = ""
    if user.y_coordinate < y_dest
      if user.x_coordinate < x_dest
        turn = "right"
      else
        turn = "left"
      end
    else
      if user.x_coordinate > x_dest
        turn = "left"
      else
        turn = "right"
      end
    end

    ["start at (#{user.x_coordinate}, #{user.y_coordinate})", "go to (#{user.x_coordinate}, #{y_dest})", "turn #{turn}", "go to (#{x_dest}, #{y_dest})", "finish at (#{x_dest}, #{y_dest})"]
  end
end