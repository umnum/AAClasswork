def windowed_max_range(arr, w)
    arr.sort!
    current_max_range = arr[w - 1] - arr[0]
    (0...arr.length - w).each do |i|
        current_max_range = (arr[i + w - 1] - arr[i]) if (arr[i + w - 1] - arr[i]) > current_max_range
    end
    current_max_range
end

#[2, 1, 5] 3
#current_max_range = 5 - 1 = 3

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8