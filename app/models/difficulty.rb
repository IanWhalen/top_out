class Difficulty
  PLUS_MINUS_VALUES = {"-" => 0, "" => 1, "+" => 2}

  def self.parse_int(val)
    'V' + (val / 3).to_s + PLUS_MINUS_VALUES.invert[val % 3].to_s
  end
  
  def initialize(difficulty)
    if difficulty.is_a? String
      @difficulty = difficulty
    elsif difficulty.is_a? Integer
      @difficulty = self.parse_int(difficulty)
    end
  end

  def to_s
    @difficulty
  end

  def to_i
    parts = @difficulty.match /^V(\d+)([\+\-]?)/
    (parts[1].to_i * 3) + plus_minus_values[parts[2]]
  end

end
