# Returns the elements that were unique.
def no_dupes?(arr)
  counter = Hash.new(0)
  results = []

  arr.each do |el|
    counter[el] += 1
  end


  counter.each do |k, v|
    if v == 1
      results << k
    end
  end

  results
end

def no_consecutive_repeats?(arr)
  (0...arr.length - 1).each do |i|
    return false if arr[i] == arr[i+1]
  end

  true
end

def char_indices(str)
  indices = Hash.new{ |h, k| h[k] = [] }

  str.each_char.with_index do |c, i|
    indices[c] << i
  end

  indices
end

def longest_streak(str)
  char = str[0]
  counter = 1
  current_counter = 0

  (0...str.length).each do |i|
    if str[i] == str[i + 1]
      current_counter += 1
    else
      current_counter = 1
    end

    if current_counter >= counter
      char = str[i]
      counter = current_counter
    end
  end

  streak = ""

  counter.times do |i|
    streak << char
  end

  streak
end

def bi_prime?(num)
  factors = []

  (2...num).each do |factor|
    if num % factor == 0
      factors << factor
    end
  end

  factors.each do |el|
    return true if factors.include?(num / el) &&
      is_prime?(num / el) &&
      is_prime?(el)
  end

  false
end

def is_prime?(num)
  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  true
end

def vigenere_cipher(message, keys)
  encoded = ""
  length = keys.length

  message.each_char.with_index do |c, i|
    index = i % length
    encoded << caesar_cipher(c, keys[index])
  end

  encoded
end

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  encoded = ""

  str.downcase.each_char do |c|
    index = alphabet.index(c)
    new_index = index + num
    new_index %= 26
    encoded << alphabet[new_index]
  end

  encoded
end

def vowel_rotate(str)
  vowels = "aeiou"
  v_bank = []
  new_word = ""

  str.each_char do |c|
    v_bank << c if vowels.include?(c)
  end

  last = v_bank.pop
  v_bank.unshift(last)
  counter = 0

  str.each_char do |c|
    if vowels.include?(c)
      new_word << v_bank[counter]
      counter += 1
    else
      new_word << c
    end
  end

  new_word
end

class String
  def select(&prc)
    if prc == nil
      return ""
    end

    new_word = ""

    self.each_char do |c|
      new_word << c if prc.call(c)
    end

    new_word
  end

  def map!(&prc)
    self.each_char.with_index do |c, i|
      self[i] = prc.call(self[i], i)
    end
  end
end

def multiply(a, b)
  return 0 if a == 0
  if a >= 0
    b + multiply(a - 1, b)
  else
    -(b - multiply(a + 1, b))
  end
end

def lucas_sequence(num)
  return [] if num == 0
  return [2] if num == 1
  return [2, 1] if num == 2
  lucas_sequence(num - 1) << lucas_sequence(num - 1)[-1] +
  lucas_sequence(num -1)[-2]
end

def prime_factorization(num)
  (2..num).each do |f|
    if num % f == 0
      p [f]
      return [f] << prime_factorization(num / f)
    end
  end
end
