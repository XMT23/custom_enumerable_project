module Enumerable
  def my_all?
    self.my_each do |item|
      return false unless yield item
    end
    return true
  end

  def my_any?
    self.my_each do |item|
      return true if yield item
    end
    return false
  end

  def my_count
    return size unless block_given?

    count = 0
    self.my_each do |item|
      if yield item then count += 1 end
    end
    return count
  end

  def my_each_with_index
    for i in 0...size
      yield self[i], i
    end
    return self
  end

  def my_inject(initial_value)
    total = initial_value
    self.my_each do |item|
      total = yield total, item
    end
    return total
  end

  def my_map
    mapped = []
    self.my_each do |item|
      mapped << yield(item)
    end
    return mapped
  end

  def my_none?
    self.my_each do |item|
      return false if yield item
    end
    return true
  end

  def my_select
    selected = []
    self.my_each do |item|
      (selected << item) if yield item
    end
    return selected
  end
end

class Array
  def my_each
    for i in 0...size
      yield self[i]
    end
    return self
  end
end
