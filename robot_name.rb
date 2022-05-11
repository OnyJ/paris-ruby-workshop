class Robot
  attr_accessor :name

  def self.all_names
    @@all_names ||= Array.new
  end

  def initialize(name = generate_name)
    @name = name
  end

  def generate_name
    name = ""
    2.times { name += 'A'.upto('Z').to_a.sample }
    3.times { name += '0'.upto('9').to_a.sample }
    if name_is_new(name)
      puts "im ok"
      Robot.all_names << name
      return name
    end
  end

  private

  def name_is_new(name)
    !Robot.all_names.include?(name)
    puts !Robot.all_names.include?(name)
  end
end

a = Robot.new
b = Robot.new
puts a.name 
puts Robot.all_names

