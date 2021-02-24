require 'benchmark'
require "byebug"

puts
puts "-" * 30 + "Phase I" + "-" * 30
puts

def anagram?(str1, str2) #n! 
    str1_arr = str1.split("")
    str2_arr = str2.split("") 
    combos = str1_arr.permutation(str1.length).to_a

    return combos.include?(str2_arr)
end

p anagram?("gizmo", "sally")
p anagram?("elvis", "lives")


def anagram_2?(str1, str2) #n^2 
    str1_arr = str1.split("")
    str2_arr = str2.split("") 

    str2_arr.each do |el|
        if str1_arr.include?(el)
            str1_arr.delete(el)
        else
            return false
        end
    end
    if str1_arr.empty?
        true
    else
        false
    end    
end

puts
puts "-" * 30 + "Phase II" + "-" * 30
puts

p anagram_2?("gizmo", "sally")
p anagram_2?("elvis", "lives")

puts
puts "-" * 30 + "Phase III" + "-" * 30
puts

def anagram_3?(str1, str2) # n^2
    str1_arr = str1.split("")
    str2_arr = str2.split("")
    str1_arr.sort == str2_arr.sort

end

p anagram_3?("gizmo", "sally")
p anagram_3?("elvis", "lives")

puts
puts "-" * 30 + "Phase IV" + "-" * 30
puts


def anagram_4?(str1, str2) #3n
    # str1_hash = Hash.new(0)
    # str2_hash = Hash.new(0)
    # # alpha = [*"a".."z"]
    # str2.each_char do |char|
    #     str1_hash[char] += 1 
    # end
    # str1.each_char do |char|
    #     str2_hash[char] += 1
    # end
    # str1_hash == str2_hash

    hash = Hash.new(0)
    str1.each_char { |char| hash[char] += 1}
    str2.each_char { |char| hash[char] -= 1}
    # str2.each_char { |char| hash.has_key?(char) ? hash[char] += 1 : false}
    # hash.values.all? {|val| val % 2 == 0 } && hash.keys.all? {|char| str2.include?(char) }
    hash.values.all? {|val| val == 0}


    #go through str1 like on line 77
end

p anagram_4?("gizmo", "sally")
p anagram_4?("elvis", "lives")



p anagram_4?("bootcamp", "pmactiib")
