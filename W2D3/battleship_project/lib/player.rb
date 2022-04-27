class Player
  def get_move
    print 'enter a position with coordinates separated with a space like `4 7`'

    input = gets.chomp
    split = input.split
    new_arr = []
    split.each do |el|
      new_arr << el.to_i
    end

    new_arr
  end
end
