class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # new_hash = Hash.new
    # self.each_with_index do |ele, i|
    #   new_hash[i] = ele.hash
    # end
    # new_hash
    map {|num| num.to_s(2).to_i}.sum
  end
end

class String
  def hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end


  a = ["a", "b", "c", "d", "e"]
  b = [1,2,3,4,5]
  c = [1,2,3,4,5,6]
  d = ["a", "b", "c", "d", "e"]
  # ahash = {0 => "a", 1 => "b", 2 => "c", 3 => "d", 4 => "e"}
  # bhash = {0 => 1, 1 => 2, 2 => 3, 3 => 4, 4 => 5}
# p a[0] == ahash[0]

puts
p "b array to hash #{b.hash}"
puts
p "c array to hash #{c.hash}"
puts
b.push(6)
p "b array to hash #{b.hash}"
# p "b hash to #{bhash[1]}"
# p a.hash
# p d.hash
