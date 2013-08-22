class Die
  attr_reader :value

  def initialize
    self.value = nil
  end

  def roll
    self.value = rand 1..6
  end

  private
  attr_writer :value
end

class Dice
  def initialize(number)
    self.dice = Array.new(number) { Die.new }
  end

  def roll
    dice.each(&:roll)
  end

  def sum
    dice.map(&:value).inject :+
  end

  private
  attr_accessor :dice
end

class Craps
  def initialize output
    self.point = nil
    self.output = output
    self.playing = true
    self.dice = Dice.new(2)
    self.first_roll = true
  end

  def play_first_roll
    self.first_roll = false
    if first_roll_win?
      self.playing = false
      output.puts "'natural' roll, you WIN!"
    elsif first_roll_lose?
      self.playing = false
      output.puts "'craps!' you LOSE!"
    else
      self.point = dice_roll
      output.puts "set point is #{point}"
    end
  end

  def play_subsequent_roll
    if subsequent_roll_lose?
      self.playing = false
      output.puts "you crapped out with a #{dice_roll}"
    elsif subsequent_roll_win?
      self.playing = false
      output.puts "you win with #{point}"
    else
      output.puts "Roll again"
    end
  end

  def roll
    while playing?
      dice.roll
      output.puts "current roll is #{dice_roll}"
      if first_roll?
        play_first_roll
      else
        play_subsequent_roll
      end
    end
  end

  private

  def dice_roll
    dice.sum
  end

  def subsequent_roll_win?
    dice_roll == point
  end

  def subsequent_roll_lose?
    dice_roll == 7
  end

  def first_roll_win?
    dice_roll == 7 || dice_roll == 11
  end

  def first_roll_lose?
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
