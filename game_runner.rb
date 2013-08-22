require './lib/craps'

Craps.new(STDOUT).roll(Die.new, Die.new, true)
