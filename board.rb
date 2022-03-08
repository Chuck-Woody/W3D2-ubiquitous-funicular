class Board

    attr_reader :grid,:size
    def initialize

        @grid = Array.new(4) {Array.new(4)}
        @size = @grid.length

    end

    def populate()
        pairs = @size *2
       
        

    end


    def get_uniq_pairs
        arr = []
       
         
        while arr.length < 17
            
            card1 = Card.new(true)
            card2 = card1.dup()
            #if the card value is already in the arr then dont create a card
            unless arr.include?(card1)
                
                arr << card1
                arr << card2
            end
                #create two identical cards
                
                #
    
            
            
            
        end
        arr 
    end





end


a = Board.new()

p a.grid

p "-------"

p a.size