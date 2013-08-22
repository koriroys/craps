require './lib/die'

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

