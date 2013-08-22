require 'craps'

describe Craps do
  let(:output) { double('output').as_null_object }
  let(:turn) { Turn.new }

  describe "first roll" do
    before do
      turn.first_roll = true
    end

    it "wins if rolls a 7" do
      expect(turn.play 7).to eq("'natural' roll, you WIN!")
    end

    it "wins if rolls an 11" do
      expect(turn.play 11).to eq("'natural' roll, you WIN!")
    end

    it "loses if rolls a 2" do
      expect(turn.play 2).to eq("'craps!' you LOSE!")
    end

    it "loses if rolls a 3" do
      expect(turn.play 3).to eq("'craps!' you LOSE!")
    end

    it "loses if rolls a 12" do
      expect(turn.play 12).to eq("'craps!' you LOSE!")
    end

    it "moves on to the next roll if not 2, 3, 7, 11, or 12 rolled" do
      expect(turn.play 9).to eq("set point is 9")
    end
  end

  describe "second roll" do
    before do
      turn.first_roll = false
    end

    it "loses if rolls a 7" do
      expect(turn.play 7).to eq("you crapped out with a 7")
    end

    it "wins if rolls the same as the first roll" do
      turn.point = 9

      expect(turn.play 9).to eq("you win with 9")
    end

    it "rolls again if point and roll are not equal" do
      turn.point = 8

      expect(turn.play 9).to eq("Roll again")
    end
  end
end
