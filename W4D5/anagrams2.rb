def anagrams2(string)
    combos = []
    permutations = string.length
    while permutations > 0
        permutations.times do
            combos
        end
        permutations -= 1
    end
end

p anagrams2("cats")