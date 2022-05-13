def anagram?(str1, str2) #O(n!) - factorial
  perms = str1.split("").permutation.to_a.map {|word| word.join}
  perms.include?(str2)
end

# puts anagram?("gizmo", "sally")    #=> false
# puts anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2) #O(n^3) polynomial
  str1_chars = str1.split("")
  str2_chars = str2.split("")

  str1_chars.each do |char|
    ind = str2_chars.find_index(char)
    if ind.nil?
      return false
    else
      str2_chars.delete(char)
    end
  end

  true
end

# puts second_anagram?("gizmo", "sally")    #=> false
# puts second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2) # O(n log n)
  str1.split("").sort == str2.split("").sort
end

# puts third_anagram?("gizmo", "sally")    #=> false
# puts third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char { |c| hash1[c] += 1 }
  str2.each_char { |c| hash2[c] += 1 }
  hash1 == hash2
end

puts fourth_anagram?("gizmo", "sally")    #=> false
puts fourth_anagram?("elvis", "lives")    #=> true
puts fourth_anagram?("zzzxxy", "yxxzzz")  #=> true
puts fourth_anagram?("zzzxxy", "yxxzz")   #=> false