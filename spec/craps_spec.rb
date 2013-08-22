require 'craps'

describe Craps do
  let(:output) { double('output').as_null_object }

  describe "first roll" do
    it "wins if rolls a 7" do
      craps = described_class.new(output)
      craps.stub_chain(:dice, :roll).and_return(7)
      craps.stub(:dice_roll).and_return(7)

      craps.roll

      expect(output).to have_received(:puts).with("'natural' roll, you WIN!")
    end

    it "wins if rolls a 11" do
      craps = described_class.new(output)
      craps.stub_chain(:dice, :roll).and_return(11)
      craps.stub(:dice_roll).and_return(11)

      craps.roll

      expect(output).to have_received(:puts).with("'natural' roll, you WIN!")
    end

    it "loses if rolls a 2" do
      craps = described_class.new(output)
      craps.stub_chain(:dice, :roll).and_return(2)
      craps.stub(:dice_roll).and_return(2)

      craps.roll

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "loses if rolls a 3" do
      craps = described_class.new(output)
      craps.stub_chain(:dice, :roll).and_return(3)
      craps.stub(:dice_roll).and_return(3)

      craps.roll

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "loses if rolls a 12" do
      craps = described_class.new(output)
      craps.stub_chain(:dice, :roll).and_return(12)
      craps.stub(:dice_roll).and_return(12)

      craps.roll

      expect(output).to have_received(:puts).with("'craps!' you LOSE!")
    end

    it "moves on to the next roll if not 2, 3, 7, 11, or 12 rolled" do
      craps = described_class.new(output)
      craps.stub_chain(:dice, :roll).and_return(9)
      craps.stub(:dice_roll).and_return(9)

      craps.roll

      expect(craps.send(:point)).to eq(9)
      expect(output).to have_received(:puts).with("set point is 9")
    end
  end

  describe "second roll" do
    let(:craps) { described_class.new(output) }

    before do
      craps.stub(:first_roll).and_return(false)
    end

    it "loses if rolls a 7" do
      craps.stub_chain(:dice, :roll).and_return(7)
      craps.stub(:dice_roll).and_return(7)

      craps.roll

      expect(output).to have_received(:puts).with("you crapped out with a 7")
    end

    it "wins if rolls the same as the first roll" do
      craps.send(:point=, 9)
      craps.stub_chain(:dice, :roll).and_return(9)
      craps.stub(:dice_roll).and_return(9)

      craps.roll
      expect(output).to have_received(:puts).with("you win with 9")
    end

    it "rolls again if point and roll are not equal" do
      craps.stub(:point).and_return(8, 9)
      craps.stub_chain(:dice, :roll).and_return(9)
      craps.stub(:dice_roll).and_return(9)

      craps.roll
      expect(output).to have_received(:puts).with("Roll again")
    end
  end
end
