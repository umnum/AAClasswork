require "byebug"

def my_uniq(array)
    new_arr = []
    array.each do |ele|
        new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
end

class Array
    def two_sum

        result = []

        (0...self.length).each do |idx1|
            (0...self.length).each do |idx2|
                if idx1 < idx2 && (self[idx1] + self[idx2] == 0)
                    result << [idx1, idx2]
                end
            end
        end
        result
    end
end

def my_transpose(array) #takes in a 2d Array
    new_grid = []
    (0...array.length).each do |col|
        new_row = []
        (0...array.length).each do |row|
            new_row << array[row][col]
        end
        new_grid << new_row
    end
    new_grid
end

def stock_picker(arr) # [2, 8, 1, 10, 17, 7, 4, 15]
    result = [0, 1]
    (0...arr.length).each do |idx1|
        (0...arr.length).each do |idx2|
            # debugger
            if idx1 < idx2
                if (arr[result[1]] - arr[result[0]]) < (arr[idx2] - arr[idx1]) #0, 1 // 0, 3 // 0, 4 => 2,17// 0, 5 => 2, 
                    result = [idx1, idx2]
                end
                # result = [0, 4]
                # result[1] => arr[result[1]] => 17
                # result[0] => arr[result[0]] => 1
            end
        end
    end
    result
end

class Hanoi
    attr_accessor :tower

    def initialize
        @tower = [[3, 2, 1], [], []]
    end

    def move(start, ending)
       
        raise ArgumentError if @tower[start].empty?
        starting_disc = @tower[start].pop
        ending_disc = @tower[ending][-1].nil? ? 4 : @tower[ending][-1]
        raise ArgumentError if starting_disc > ending_disc
        
        @tower[ending].push(starting_disc)
        @tower
    end

    def won?
        @tower[2].length == 3
    end
end