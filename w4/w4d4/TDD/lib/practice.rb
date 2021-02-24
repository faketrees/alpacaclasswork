def my_uniq(array)
    new_hash = Hash.new(0)
    array.each do |ele|
        new_hash[ele] += 1
    end
    results = []
    new_hash.each do |k,v|
        if v >= 1 
            results << k
        end
    end
    results
end


def two_sum(array)
    results = []
    array.each_with_index do |ele1, idx1|
        array.each_with_index do |ele2, idx2|
            if idx2 > idx1 && ele1 + ele2 == 0
                results << [idx1, idx2]
            end
        end
    end
    results
end



def my_transpose(array)
  new_arr = Array.new(array.length) {Array.new(array.length)}
  array.each_with_index do |_, idx1|
    array.each_with_index do |_, idx2|
      new_arr[idx2][idx1] = array[idx1][idx2] 
    end
  end
  new_arr
end



#[9, 7, 3, 5, 6, 7, 3] => [1,4] length of 7
def stock_picker(array)
    #once we find the min, then we could do a .drop on the array
    #find the max of the 'dropped array'
    #make sure we record the indexes and add the min index to the index of the new dropped array
    min = array.min
    min_ind = array.index(min)
    dropped = array.drop(min_ind + 1)
    max = dropped.max
    max_ind = dropped.index(max) + (min_ind + 1)
    [min_ind, max_ind]
end