
def anagrams2(string)
    return " " if string.length == 0
    combos = "" 
    string.each_char do |char|
        combos += char + anagrams(string[1..-1])
    end
    combos
end


def anagrams(str)
    i = 0
    combos = []
    while i < str.length 
        j = i + 1
        subcombos = []
        add_str = str[i]
        while subcombos.length < str.length 
            add_str += str[j % str.length]
            if add_str.length == str.length
                subcombos << add_str
                add_str = str[i]
            end
            j += 1
        end
        i += 1
        combos += subcombos
    end
    combos
end

p anagrams("cats")