require_relative 'card.rb'

class Board

    attr_reader :size, :grid

    def initialize(size=4)

        @grid = Array.new(size) {Array.new(size)}
        @size = size

    end

    def populate

        arr_shuffled_cards = Card.shuffle(@size * 2)

        (0...@size).each do |i|
            @grid[i].each_with_index do |el, j|
                @grid[i][j] = arr_shuffled_cards.pop                
            end
        end
        
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @grid[x][y] = value
    end
    
    def render

        print "  "

        (0...@size).each do |i|
            print i.to_s + " "

        end
        puts
        @grid.each_with_index do |row, i|             
            print i.to_s + " "
            row.each do |el|                
                if el.revealed
                    print el.face_value + ' '

                else
                    print  "  "

                end            
            end
            puts
        end
        puts

    end

    def won?
        @grid.all? do |sub_arr|
            sub_arr.all? do |el|
                el.revealed == true
            end
        end
    end

    def reveal(pos)
        x, y = pos
        @grid[x][y].turn_over
    end

    def hide(pos)
        x, y = pos
        @grid[x][y].hide
    end

end




