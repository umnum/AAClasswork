#Optimized
def my_min(list)
    lowest = list[0]
    list.each do |el1|
        lowest = el1 if el1 < lowest
    end
    lowest
end

#Unoptimized
def my_min2(list)
    min = list[0]
    list.each_with_index do |el1, i1|
        list.each_with_index do |el2, i2|
            min = el1 if i1 < i2 && min > el2
        end
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5

def largest_contiguous_subsum(list)
    subarrays = []
    list.each_with_index do |el1, i1|
        list.each_with_index do |el2, i2|
            subarrays << list[i1..i2] if i2 >= i1 && !subarrays.include?(list[i1..i2])
        end
    end
    max = subarrays[0].sum
    subarrays.each do |subarr| 
        if subarr.sum > max
            max = subarr.sum 
        end 
    end 
    max
end

list = [5, 3, -7]
p largest_contiguous_subsum(list)
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]  

# index
# [5, 3, -7]
# largest_sum = largest at step 1
# current_sum

# step 1: index 0:  if 5 + 3 + (-7) > 5 => largest_sum = 5, current_sum = 5
# step 2: index 1:  if 3 - 7 > current_sum =>  largest_sum = 5, current_sum = 5
# step 3: 

# [5, -7, 3]

def largest_contiguous_subsum(list)
    largest_sum = list[0] #aka 5 =>  || i = 1 -> stays 5 || i = 2 -> stay 5
    current_sum = list[0] #aka 5 => || i = 1 -> no, so = -7 || i = 2 -> no, so = 3
    (1..list.length - 1).each do |i|
        current_sum += list[i]
        if current_sum < 0
            current_sum = 0
            # current_sum = list[i - 1]
        end
        if current_sum > largest_sum && largest_sum > 0
            largest_sum = current_sum
        elsif list[i] > largest_sum 
            largest_sum = list[i]
        end
    end
    largest_sum 
end
#Acc until resetting, know when to reset
list = [-3, -2, -6, -7, -6, -7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

def anagrams?(word1, word2)
    hash = Hash.new(0)
    word1.each_char do |char|
        hash[char] += 1
    end
    word2.each_char do |char|
        hash[char] -= 1
    end
    hash.values.all? { |val| val == 0 }
end

p anagrams?("gizmo", "sally")    #=> false
p anagrams?("elvis", "lives")    #=> tru 
# just wating for someone to let me in , you got it
actually... can you head back into the main room?