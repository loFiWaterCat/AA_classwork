require 'byebug'

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


# O(n^3) - polynomial
def largest_cont_sum(list)
  arr = []

  list.each_with_index do |num1, i|
    list.each_with_index do |num2, j|
      if j >= i
        arr << list[i..j]
      end
    end
  end
  arr.map { |sub| sub.sum }.max
  
end

list2 = [2, 3, -6, 7, -6, 7]
puts largest_cont_sum(list2)

def largest_cont_sum_2(list)
    cur = list[0]
    lrg = list[0]
    i = 0
    j = 0
    reset = false
    # debugger
    (1..list.length - 1).each do |idx| #starts loop at second element
        cur += list[idx] #current += next element
        if cur > lrg 
            if reset
                i = idx
            end
            lrg = cur
            j = idx  
            reset = false
        elsif list[idx] > lrg
            lrg = list[idx]
            i = idx
            j = idx
            cur = lrg
        end
        if (idx + 1 < list.length - 1) && cur + list[idx + 1] <= list[idx + 1]
            cur = list[idx + 1]
            reset = true
        end
    end
    list[i..j].sum
    # p list[i..j]
end

list3 = [-5, -1, -3]

puts largest_cont_sum_2(list2)

