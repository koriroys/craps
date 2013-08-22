class Die
  def roll
    rand(1..6)
  end
end

class Craps
  def initialize(output)
    @point = nil
    @output = output
  end

  def roll (die1, die2, first_roll)
    dice_roll = die1.roll + die2.roll
    if first_roll
      if pass (dice_roll)
        output.puts "'natural' roll, you WIN!"
      elsif no_pass(dice_roll)
        output.puts "'craps!' you LOSE!"
      else
        @point = dice_roll
        puts "set point is #{@point}"
        die1 = Die.new
        die2 = Die.new
        roll(die1, die2, false)
      end
    else
      puts "current roll is #{dice_roll}"
      if dice_roll == 7
        puts "you crapped out with a #{dice_roll}"
      elsif dice_roll == @point
        puts "you win with #{@point}"
      else
        die1 = Die.new
        die2 = Die.new
        roll(die1, die2, false)
      end
    end
  end

  private

  def pass dice_roll
    (dice_roll == 7 || dice_roll == 11)
  end

  def no_pass dice_roll
    dice_roll == 2 || dice_roll == 3 || dice_roll == 12
  end

  attr_accessor :output
end
