class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |sub|
      puts sub.join(" ")
    end
  end


  def initialize(n)
    @grid = Array.new(n) { Array.new(n) {:N} }
    @size = (n * n)
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count = 0

    @grid.each do |row|
      row.each do |el|
        count += 1 if el == :S
      end
    end

    count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    ships_left = @size / 4

    i = 0
    j = 0

    length = @grid[0].length
    while ships_left > 0
      if i == length
        i = 0
      end
      j = 0
      while j < length
        chance = rand(1..4)
        if chance == 1 && @grid[i][j] == :N && ships_left > 0
          @grid[i][j] = :S
          ships_left -= 1
        end
        j += 1
      end
      i += 1
    end
  end

  def hidden_ships_grid
    length = @grid[0].length
    i = 0
    j = 0
    hidden_grid = Array.new(length) { Array.new(length) }

    while i < length
      while j < length
        if @grid[i][j] == :S
          hidden_grid[i][j] = :N
        else
          hidden_grid[i][j] = @grid[i][j]
        end
        j += 1
      end
      i += 1
      j = 0
    end

    hidden_grid
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
