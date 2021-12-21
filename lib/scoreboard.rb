class Scoreboard
  def initialize(rolls)
    @rolls = rolls
    @score = 0
  end

  def score
    index = 0
    10.times do
      if strike?(@rolls[index])
        @score += 10 + strike_bonus_points(index)
      elsif spare?(@rolls[index], @rolls[index + 1])
        @score += 10 + spare_bonus_points(index)
      else
        @score += @rolls[index] + @rolls[index + 1]
      end
      strike?(@rolls[index]) ? index += 1 : index += 2
    end
    @score
  end

  def strike?(pin)
    true if pin == 10
  end

  def spare?(pin1, pin2)
    true if pin1 + pin2 == 10
  end

  def strike_bonus_points(index)
    @rolls[index + 1] + @rolls[index + 2]
  end

  def spare_bonus_points(index)
    @rolls[index + 2]
  end

end
