class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, '_') }
  end

  def valid?(position)
    row, col = position
    size = @grid.length
    return true if (row < size) &&
    (row >= 0) &&
    (col < size) &&
    (col >= 0)
    false
  end

  def empty?(position)
    row, col = position
    return true if @grid[row][col] == '_'
    false
  end
  def place_mark(position, mark)
    row, col = position
    if valid?(position)
      if empty?(position)
        @grid[row][col] = mark
      else
        raise "Not empty."
      end
    else
      raise "Not valid."
    end
  end

  def print
    @grid.each do |row|
      puts row.join(" ")
    end
  end

  def win_row?(mark)
    @grid.each do |row|
      return true if row.all? { |el| el == mark }
    end
    false
  end

  def win_col?(mark)
    size = @grid.length

    (0...size).each do |i|
      counter = 0
      (0...size).each do |j|
        el = @grid[j][i]
        counter += 1 if el == mark
      end
      return true if counter == size
    end
    false
  end

  def win_diagonal?(mark)
    size = @grid.length
    counter = 0

    (0...size).each do |i|
      el = @grid[i][i]
      counter += 1 if el == mark
    end

    return true if counter == size

    counter = 0
    (0...size).each do |i|
      j = size - 1 - i
      el = @grid[i][j]
      counter += 1 if el == mark
      i += 1
    end

    return true if counter == size
    false
  end

  def empty_positions?
    @grid.each do |row|
      row.each do |el|
        return true if el == '_'
      end
    end

    false
  end

  def legal_positions
    size = @grid.length
    legal = []

    (0...size).each do |i|
      (0...size).each do |j|
        if self.valid?([i, j]) && self.empty?([i, j])
          legal << [i, j]
        end
      end
    end

    legal
  end
end
