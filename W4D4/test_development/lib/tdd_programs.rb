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
end
