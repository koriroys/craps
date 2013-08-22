require 'craps'

describe Craps do
  it "wins if rolls a 7 on the first roll" do
    output = double('output').as_null_object
    die1 = Die.new
    die1.stub(:roll).and_return(3)
    die2 = Die.new
    die2.stub(:roll).and_return(4)
    player = described_class.new(output)

    player.roll(die1, die2, true)

    expect(output).to have_received(:puts).with("'natural' roll, you WIN!")
  end

  it "loses if rolls a 3 on the first roll" do
    output = double('output').as_null_object
    die1 = Die.new
    die1.stub(:roll).and_return(1)
    die2 = Die.new
    die2.stub(:roll).and_return(2)
    player = described_class.new(output)

    player.roll(die1, die2, true)

    expect(output).to have_received(:puts).with("'craps!' you LOSE!")
  end
end
