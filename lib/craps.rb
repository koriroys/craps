class Die
  def roll
    rand(1..6)
  end
end

class Craps
  def initialize(output)
    self.point = nil
    self.output = output
    self.playing = true
    self.dice = [Die.new, Die.new]
    self.first_roll = true
  end

  def roll
    while playing?
      dice_roll = roll_dice
      output.puts "current roll is #{dice_roll}"
      if first_roll?
        if pass dice_roll
          output.puts "'natural' roll, you WIN!"
          self.playing = false
        elsif no_pass dice_roll
          output.puts "'craps!' you LOSE!"
          self.playing = false
        else
          self.point = dice_roll
          output.puts "set point is #{point}"
        end
        self.first_roll = false
      else
        if dice_roll == 7
          output.puts "you crapped out with a #{dice_roll}"
          self.playing = false
        elsif dice_roll == point
          output.puts "you win with #{point}"
          self.playing = false
        else
          output.puts "Roll again"
        end
      end
    end
  end

  private

  def roll_dice
    dice.map(&:roll).inject(:+)
  end

  def pass dice_roll
    (dice_roll == 7 || dice_roll == 11)
  end

  def no_pass dice_roll
    dice_roll == 2 || dice_roll == 3 || dice_roll == 12
  end

  def first_roll?
    first_roll
  end

  def playing?
    playing
  end

  attr_accessor :output, :playing, :point, :dice, :first_roll
end
