class Array
    def my_uniq
        uniq = []
        self.each do |el|
            uniq << el if !uniq.include?(el)
        end
        uniq
    end

    def two_sum
        pairs = []
        len = self.length
        (0...len).each do |i|
            (i+1...len).each do |j|
                if self[i] + self[j] == 0
                    pairs << [i,j]
                end
            end
        end
        pairs
    end

    def my_transpose
      transpose = Array.new(self.length) {Array.new(self.length)}
      (0...self.length).each do |i|
        (0...self.length).each do |j|
           transpose[i][j] = self[j][i]
        end
      end
      transpose
    end

    def stock_picker
      best_i = 0
      best_j = 0
      profit = 0
      (0...self.length - 1).each do |i|
        (i + 1...self.length).each do |j|
          new_profit = self[j] - self[i]
          if new_profit > profit
            profit = new_profit
            best_i = i
            best_j = j
          end
        end
      end

      [best_i, best_j]
    end
end
