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

        # 
        count = 0 

        (0...3).each do |i|

            @grid[i].each do |j|

                @grid[[i,j]] = arr[count]
                count += 1

            end
        end
        return @grid
        # p arr
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
        row,col = pos
        @grid[row,col]
    end

    def []=(pos, input)
        row, col = pos
        @grid[row,col] = input 
    end
    



end


a = Board.new()

