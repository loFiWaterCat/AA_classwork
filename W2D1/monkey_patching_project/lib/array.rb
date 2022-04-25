# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0

    self.max - self.min
  end

  def average
    return nil if self.length == 0

    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.length == 0

    length = self.length

    if length % 2 == 1
      return self.sort[length / 2]
    else
      return (self.sort[length/2] + self.sort[length/2 - 1]) / 2.0
    end
  end

  def counts
    counts = Hash.new(0)
    self.each do |el|
      counts[el] += 1
    end

    counts
  end

  def my_count(arg)
    count = 0
    self.each do |el|
      count += 1 if el == arg
    end
    count
  end

  def my_index(arg)
    self.each_with_index do |el, i|
      if el == arg
        return i
      end
    end

    nil
  end

  def my_uniq
    new_arr = []
    self.each do |el|
      if !new_arr.include?(el)
        new_arr << el
      end
    end

    new_arr
  end

  def my_transpose
    length = self.length
    new_arr = []

    (0...self.length).each do |i|
      sub = []
      (0...self.length).each do |j|
        sub << self[j][i]
      end
      new_arr << sub
    end

    new_arr
  end



end

