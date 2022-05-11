class Robot
  attr_accessor :name

  def self.all_names
    @@all_names ||= Array.new
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.forget
    self.all.each do |instance| 
      instance.name = instance.generate_name
      instance.validate_name
    end
  end

  def initialize(name = generate_name)
    @name = name
    validate_name
  end

  def generate_name
    name = ""
    2.times { name += 'A'.upto('Z').to_a.sample }
    3.times { name += '0'.upto('9').to_a.sample }
    name
  end

  def validate_name
    if name_is_new?
      Robot.all_names << @name
    else
      @name = generate_name
      validate_name
    end
  end

  def reset
    #I just exist for administrative purposes. I'm sad.
  end

  private

  def name_is_new?
    !Robot.all_names.include?(@name)
  end

end

a = Robot.new("Babar")
b = Robot.new("Céleste")
puts 

puts "initial memory"
puts Robot.all_names
puts

Robot.forget

puts "New names"
puts a.name
puts b.name
puts

puts "New memory"
puts Robot.all_names

