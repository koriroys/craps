class Die
  def roll
    rand(1..6)
  end
end

class Craps
  def initialize(output)
    @point = nil
    @output = output
    @playing = true
  end

  def roll(die1, die2, first_roll)
    while @playing
      dice_roll = die1.roll + die2.roll
      if first_roll
        if pass(dice_roll)
          output.puts "'natural' roll, you WIN!"
          @playing = false
        elsif no_pass(dice_roll)
          output.puts "'craps!' you LOSE!"
          @playing = false
        else
          @point = dice_roll
          output.puts "set point is #{@point}"
        end
        first_roll = false
      else
        output.puts "current roll is #{dice_roll}"
        if dice_roll == 7
          output.puts "you crapped out with a #{dice_roll}"
          @playing = false
        elsif dice_roll == @point
          output.puts "you win with #{@point}"
          @playing = false
        else
          output.puts "Roll again"
        end
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
