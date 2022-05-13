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
puts my_min(list)
