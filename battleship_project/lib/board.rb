class Board
  # def self.print_grid(grid)
  #   grid.each do |el|
  #     puts el.join(' ')
  #   end
  # end

  # def initialize(n)
  #   @grid = Array.new(n) { Array.new(n, :N) }
  #   @size = n * n
  # end

  # attr_reader :size

  # def [](arr)
  #   row, col = arr
  #   @grid[row][col]
  # end

  # def []=(pos, val)
  #   @grid[pos[0]][pos[1]] = val
  # end

  # def num_ships
  #   @grid.flatten.count(:S)
  # end

  # def attack(pos)
  #   if self[pos] == :S
  #     self[pos] = :H
  #     puts 'You sunk my underwear?'
  #     true
  #   else
  #     self[pos] = :X
  #     false
  #   end
  # end

  # def place_random_ships
  #   new_ships = @size * 0.25

  #   while num_ships < new_ships
  #     rand_row = rand(0...@grid.size)
  #     rand_col = rand(0...@grid.size)
  #     pos = [rand_row, rand_col]
  #     self[pos] = :S
  #   end
  # end

  # def hidden_ships_grid
  #   @grid.map { |arr| arr.map { |el| el == :S ? el = :N : el } }
  # end

  # def cheat
  #   Board.print_grid(@grid)
  # end

  # def print
  #   Board.print_grid(hidden_ships_grid)
  # end
end


# battle = Board.new(4)
# p battle.[[2,4]]