require 'craps'

describe Craps do
  describe "first roll" do
    it "wins if rolls a 7" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(3)
      die2 = Die.new
      die2.stub(:roll).and_return(4)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'natural' roll, you WIN!")
    end

    it "wins if rolls a 11" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(3)
      die2 = Die.new
      die2.stub(:roll).and_return(4)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'natural' roll, you WIN!")
    end

    it "loses if rolls a 2" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(1)
      die2 = Die.new
      die2.stub(:roll).and_return(1)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "loses if rolls a 3" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(1)
      die2 = Die.new
      die2.stub(:roll).and_return(2)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "loses if rolls a 12" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(6)
      die2 = Die.new
      die2.stub(:roll).and_return(6)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "moves on to the next roll if not 2, 3, 7, 11, or 12 rolled" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(4)
      die2 = Die.new
      die2.stub(:roll).and_return(5)
      craps = described_class.new(output)

      craps.roll(die1, die2, true)

      expect(craps.instance_variable_get(:@point)).to eq(9)
      expect(output).to have_received(:puts).with("set point is 9")
    end
  end

  describe "second roll" do
    it "loses if rolls a 7" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(3)
      die2 = Die.new
      die2.stub(:roll).and_return(4)
      craps = described_class.new(output)

      craps.roll(die1, die2, false)
      expect(output).to have_received(:puts).with("you crapped out with a 7")
    end

    it "wins if rolls the same as the first roll" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(5)
      die2 = Die.new
      die2.stub(:roll).and_return(4)
      craps = described_class.new(output)
      craps.instance_variable_set(:@point, 9)

      craps.roll(die1, die2, false)
      expect(output).to have_received(:puts).with("you win with 9")
    end

    it "wins if rolls the same as the first roll" do
      output = double('output').as_null_object
      die1 = Die.new
      die1.stub(:roll).and_return(4)
      die2 = Die.new
      die2.stub(:roll).and_return(4)
      craps = described_class.new(output)
      craps.instance_variable_set(:@point, 9)

      craps.roll(die1, die2, false)
      expect(output).to have_received(:puts).with("Roll again")
    end
  end
end
