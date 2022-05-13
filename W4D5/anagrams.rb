def anagram?(str1, str2)
  perms = str1.split("").permutation.to_a.map {|word| word.join}
  perms.include?(str2)
end

# puts anagram?("gizmo", "sally")    #=> false
# puts anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
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

puts second_anagram?("gizmo", "sally")    #=> false
puts second_anagram?("elvis", "lives")    #=> true
