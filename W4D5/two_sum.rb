# O(n^2) - quadratic
def bad_two_sum?(arr, target)
  subs = []

  arr.each_with_index do |el, i|
    (i + 1...arr.length).each do |j|
      subs << [el, arr[j]]
    end
  end

  subs.each { |sub| return true if sub.sum == target }
  false
end

arr = [0, 1, 5, 7]
#puts bad_two_sum?(arr, 6) # => should be true
#puts bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)
end

# O(n) - linear
def two_sum?(arr, target)
  hash = Hash.new(0)

  arr.each do |el|
    if hash.has_key?(target - el)
      return true
    else
      hash[el] = true
    end
  end
  false
end

puts two_sum?(arr, 6) # => should be true
puts two_sum?(arr, 10) # => should be false
