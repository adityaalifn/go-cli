class Driver < People
  @@total = 0
  @@driver_name_list = ["Adimul", "Bento", "Paijo", "Sukirman", "Mbok Darmi", "Uvuvwevwevwe Onyetenvewve Ugwemubwem Ossas", "Jholeasuna Lapuslamarekanaujbck Ugwemubwem Osassla"].shuffle!
  attr_reader :name

  def initialize
    super
    @@total += 1
    @name = @@driver_name_list.shift
  end

  def self.total
    @@total
  end
end