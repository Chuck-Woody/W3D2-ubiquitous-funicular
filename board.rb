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


    # def get_uniq_pairs
    #     arr = []      
         
    #     while arr.length < 17
            
    #         card1 = Card.new(true)
    #         card2 = card1.dup()
    #         unless arr.include?(card1)                 
    #             arr << card1
    #             arr << card2
    #         end   
    #     end
    #     arr 
    # end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @grid[x][y] = value
    end
    
    def render

        @grid.each do |row| 
            
            row.each do |el|

                #if the card is revealed show the value of the card
                if el.revealed
                    print el.face_value

                else
                    print  " "

                end
                #else we show nil 

            
            end
            puts
        end
        put
    end



end




