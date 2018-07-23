class Recipe
  attr_reader :name
  attr_reader :description
  attr_reader :prep_time
  attr_accessor :done
  attr_reader :difficulty

  def initialize(name, description, prep_time, difficulty)
    @name = name
    @description = description
    @prep_time = prep_time
    @difficulty = difficulty
    @done = false
  end

  def to_array
    [@name.to_s, @description.to_s, @prep_time.to_s, @difficulty.to_s]
  end

  def done?
    @done
  end

  def mark_as_cooked!
    @done = true
  end
end
