require "byebug"

class Array
  def my_each(&prc)
    size = self.length

    i = 0
    self.length.times do
      prc.call(self[i])
      i += 1
    end

    self
  end

  def my_select(&prc)
    selected = []

    self.my_each do |num|
      selected << num if prc.call(num)
    end

    selected
  end

  def my_reject(&prc)
    selected = []

    self.my_each do |num|
      selected << num if !prc.call(num)
    end

    selected
  end

  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |num|
      return false if !prc.call(num)
    end

    true
  end
  def my_flatten
    flattened = []

    self.my_each do |el|
      if !el.kind_of?(Array)
        flattened << el
      else
        flattened += el.my_flatten
      end
    end

    flattened
  end

  def my_zip(*args)
    big_arr = []

    counter = 0
    self.my_each do |el|
      big_sub = []
      big_sub << el

      args.my_each do |sub|
        big_sub << sub[counter]
      end

      big_arr << big_sub
      counter += 1
    end

    big_arr
  end

  def my_rotate(num = 1)
    rotated = self.clone

    if num < 0
      while num < 0
        last = rotated.pop
        rotated.unshift(last)
        num += 1
      end
    end

    while num > 0
      first = rotated.shift
      rotated.push(first)
      num -= 1
    end

    rotated
  end

  def my_join(arg = "")
    joined = ""

    first = true
    self.my_each do |el|
      if first
        joined += el
        first = false
      else
        joined += arg + el
      end
    end

    joined
  end

  def my_reverse
    length = self.length
    reversed = []

    self.reverse_each do |el|
      reversed << el
    end

    reversed
  end
end


