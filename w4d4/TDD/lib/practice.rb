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