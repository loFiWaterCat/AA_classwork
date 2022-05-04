require "byebug"

def deep_dup(arr)
    return [] if arr.length == 0

    if !arr[-1].is_a?(Array)
        deep_dup(arr[0...-1]) << arr[-1]
    else
        deep_dup(arr[0...-1]) << deep_dup(arr[-1])
    end

end

# p deep_dup([1, 2, [3, 4, 5, [6, 7]]])

def fibs(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    pre = fibs(n - 1)
    pre << pre[-1] + pre[-2]
end

# p fibs(7)

def bsearch(array, target)
    return nil if array.length == 0
    mid = array.length / 2

    return mid if array[mid] == target

    left = array[0...mid]
    right = array[mid + 1..-1]

    
    if array[mid] > target
        bsearch(left, target)
    else
        stack = bsearch(right, target)
        if !stack
            return nil
        end
        stack + left.length + 1
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)
    return arr if arr.length == 1
    mid = arr.length / 2

    left = arr[0...mid]
    right = arr[mid ..-1]

    left_sort = merge_sort(left)
    right_sort = merge_sort(right)

    merge(left_sort, right_sort)



end

def merge(arr_1, arr_2)
    count = arr_1.length + arr_2.length
    sorted_arr = []

    while count > 0
        if arr_1.empty?
            sorted_arr << arr_2.shift
            count -= 1
            next
        elsif arr_2.empty?
            sorted_arr << arr_1.shift
            count -= 1
            next
        end

        if arr_1[0] < arr_2[0]
            sorted_arr << arr_1.shift
        else
            sorted_arr << arr_2.shift
        end
        count -= 1
    end
    sorted_arr
end


# p merge_sort([38, 27, 43, 3, 9, 82, 10])

def subsets(arr)
    #return arr if arr.length <= 1


    p subsets(arr[0...-1])
end

p subsets([1, 2, 3])