def two_sum(arr, target_sum)
    hash = Hash.new(0)
    arr.each_with_index do |el, i| 
        hash[el] += 1
        return true if hash.has_key?(target_sum - el)
endend
    false uh oh 



    target: 3

    [-4, -1, 0, 2, 4, 7]