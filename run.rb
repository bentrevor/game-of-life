require './lib/cells'
require './lib/game'

n = 120**2
random_grid = Array.new n
n.times do |i|
  random_grid[i] = [0,1].sample
end

game = Game.new random_grid

def show(game)
  grid = game.cells.grid

  grid.each_with_index do |cell, index|
    char = if cell == 0
             ' '
           else
             '@'
           end

    if index % game.cells.width == 0
      char << "\n"
    end
    print char
  end
end

loop do
  system 'clear'
  show(game)
  game.next_generation
end
