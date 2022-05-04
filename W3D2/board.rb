require "./card.rb"
require "byebug"
class Board
    attr_reader :grid, :win

    def initialize(size = 4)
        @grid = Array.new(size + 1) {Array.new(size + 1, " ")}
    indicator = (1..size).to_a.unshift(" ")
    @grid[0] = indicator
    @grid = @grid.transpose
    @grid[0] = indicator


        @size = size
    end

    def populate
        alphabet = "abcdefghijklmnopqrstuvwxyz".split("")
        used = ""
        times = (@size * @size) / 2
        counter = 0

        while counter < times

            letter = alphabet.sample
            while used.include?(letter)
            letter = alphabet.sample
            end
            used += letter

            2.times do
                position = get_rand_pos
                while !position_valid?(position)
                    position = get_rand_pos
                end

                card = Card.new(letter)
                row, col = position
                @grid[row][col] = card
            end

            counter += 1
        end
    end

    # def render
    # @grid.each do |row|
    #     puts row.join(" | ")
    # end

    def render
    @grid.each do |row|
        sub = []
        row.each do |ele|
           if ele.is_a?(Card)
            sub << ele.print
           else
            sub << ele
           end
        end
        puts sub.join(" | ")
        end
    end

    def reveal(position)
        row, col = position
        @grid[row][col].reveal
        @grid[row][col].value
    end

    def hide(position)
        row,col = position
        @grid[row][col].hide
    end

    def get_rand_pos
        row = rand(1..@size)
        col = rand(1..@size)
        [row, col]
    end

    def position_valid?(idx)
        row, col = idx

        if @grid[row][col] == " "
            return true
        else
            false
        end
    end

   def win?
    (1..@size).each do |i1|
        (1..@size).each do |i2|
            if @grid[i1][i2].revealed == false
                return false
            end
        end
    end

    return true
   end

end
