def range(start, last)
    return [] if last < start
    return [] if start == last
    range(start, last - 1) << last - 1
end

# p range(1, 5)

def range_iter(start, last)
    arr = []
    (start...last).each do |num|
        arr << num
    end
    arr
end

# p range_iter(1, 5)

def exp_1(b, n)
    return 1 if n == 0
    b * exp_1(b, n-1)
end

# p exp_1(3, 4)

def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n % 2 == 0
        anything = exp_2(b, n/2)
        return anything * anything
    else
        anything = exp_2(b, (n-1)/2)
        return anything * anything * b
    end
end

# p exp_2(3, 4)