require_relative 'card.rb'

class Board

    

    attr_reader :size, :grid
    def initialize

        @grid = Array.new(4) {Array.new(4)}
        @size = @grid.length

    end

    def populate
        pairs = @size * 2
        arr = []
            pairs.times do 
                a = Card.new(true)
                b = a.dup
                arr << a
                arr << b
            end
        
            arr.shuffle!

        @grid.each_with_index do |sub_arr, i1|
            sub_arr.each_with_index do |el, i2|
                @grid[i1, i2] = arr[i1][i2]
            end
        end
        return @grid
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
        @grid[pos.first][pos.last]
    end

    def []=(pos, input)
        @grid[pos.first][pos.last] = input 
    end
    



end


a = Board.new()

