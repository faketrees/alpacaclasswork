class MaxIntSet

  attr_reader :max, :store

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :num_buckets, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if !self.include?(num)
      @store[num % num_buckets] << num 
      self.count += 1
    end

    resize! if num_buckets <= count
    
  end

  def remove(num)
    @store.each do |subarray|
      if subarray.include?(num)
        subarray.delete(num)
        self.count -= 1
      end
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize! #n^2
    new_arr = Array.new(num_buckets * 2) {Array.new}
    new_buckets = num_buckets * 2
    @store.flatten!.each do |num|
      new_arr[num % new_buckets] << num
    end
    @store = new_arr
  end

end
