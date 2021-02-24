require 'benchmark'
require "byebug"



def my_min(arr)  # time complexity = O(n ^2)
  min = arr[0]
  arr.each do |ele_1|
    arr.each do |ele_2|
      if ele_1 < ele_2 
        if ele_1 < min
          min = ele_1
        end
      else
        if ele_2 < min
          min = ele_2
        end
      end
    end
  end
  return min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]


def my_min2(arr) #O(n)
  min = arr[0]
  arr.each do |el|
    if el < min
      min = el
    end
  end
  min
end

puts Benchmark.measure{my_min(list)}  # =>  -5
puts Benchmark.measure{my_min2(list)} # => -5

puts 
puts "-" * 30 + "Largest Contiguous Sub-sum" + "-" * 30
puts

def largest_contigiuous_subsum(arr) # n^3

  subs = []
  (0...arr.length).each do |idx|
    arr.each_with_index do |el, idx_2|
      if idx <= idx_2
        subs << arr[idx..idx_2]
      end
    end
  end
  max = subs.map! {|sub| sub.sum}.max
end

 # subs << arr.combination(i).to_a

 def largest_contigiuous_subsum_2(arr)
  max = arr[0]
  current_sum = arr[0]
  arr.inject(0) do |acc, el|
    # debugger
    acc += el
    if acc > max 
      max = acc
    end
    if acc < 0
      acc = 0
    end
    acc
  end

  max
end

 list2 = [2, 3, -6, 7, -6, 7]
p largest_contigiuous_subsum_2(list2) #=> 8


# require 'benchmark'
# n = 50000
# Benchmark.bm do |x|
#   x.report { my_min([*]); end }
#   x.report { n.times do   ; a = "1"; end }
#   x.report { 1.upto(n) do ; a = "1"; end }
# end


# puts my_min(list)
# include Benchmark         # we need the CAPTION and FORMAT constants
# n = 5000000
# Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
#   tf = x.report(":my_min")   { for i in 1..n; a = "1"; end }
#   # tt = x.report("times:") { n.times do   ; a = "1"; end }
#   # tu = x.report("upto:")  { 1.upto(n) do ; a = "1"; end }
#   # [tf+tt+tu, (tf+tt+tu)/3]
# end
          
      




