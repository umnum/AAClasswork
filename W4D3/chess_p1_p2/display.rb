require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
    attr_reader :grid, :cursor_pos
    def initialize(board)
        @cursor = Cursor.new([0,0],board)
        @grid = board.grid
    end

    def render
        puts "  #{("a".."h").to_a.join('  ')}"
        grid.each_with_index do |row,i|
            print "#{8-i} "
            row.each_with_index do |piece,j|
                if @cursor.cursor_pos == [i,j]
                    color = (@cursor.selected ? :green : :blue)
                else
                    color = (piece.color == "w" ? :white : :red)
                end
                print "#{piece.symbol.encode('utf-8').ljust(3)}".colorize(color)
            end
            puts
            # puts "#{i} "
        end
        puts 
        # "  #{(0..7).to_a.join('  ')}"
        nil
    end

    def move_cursors
        while true
            system("clear")
            self.render
            @cursor.get_input
        end
    end

end


if $PROGRAM_NAME == __FILE__
    testboard = Board.new
    play = Display.new(testboard)
    play.render
    testboard.move_piece([6,5],[4,5])
    testboard.move_piece([1,4],[2,4])
    testboard.move_piece([6,6],[4,6])
    testboard.move_piece([0,3],[4,7])
    play.render
    puts testboard.in_check?('w')
    
end