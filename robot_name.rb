class Robot
  attr_accessor :name

  def self.all_names
    @@all_names ||= Array.new
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

  private

  def name_is_new?
    !Robot.all_names.include?(@name)
  end

end

a = Robot.new("Babar")
b = Robot.new("Babar")
puts Robot.all_names

