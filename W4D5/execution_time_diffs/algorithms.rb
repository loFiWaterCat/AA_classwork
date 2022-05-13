# O(n^2) - quadratic
def my_min(list)
    list.each_with_index do |num, i|
        list.each_with_index do |num_2, j|
            if i == j
                next
            end
            if num_2 < num
                break
            end
            if j == list.length - 1 && num < num_2
                return num
            end
        end
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# puts my_min(list)


# O(n) - linear
def my_min_2(list)
    min = list[0]
    list.each { |num| min = num if num < min }
    min
end

# puts my_min_2(list)


# O(n^2) - quadratic
def largest_cont_sum(list)
  arr = []

  list.each_with_index do |num1, i|
    list.each_with_index do |num2, j|
      if j >= i
        arr << list[i..j].sum
      end
    end
  end

  arr.max
end

list2 = [2, 3, -6, 7, -6, 7]
puts largest_cont_sum(list2)


