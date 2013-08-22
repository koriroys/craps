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

