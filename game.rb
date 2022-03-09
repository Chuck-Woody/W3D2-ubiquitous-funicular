require_relative 'board.rb'
require_relative 'card.rb'

require 'byebug'
class Game

    def initialize
        @board = Board.new
        @previous_guess = []

    end

    def get_pos
        puts 'Please enter the position of the card you would like to flip (e.g., "2,3")'
        input = gets.chomp.split(',')
        begin
            guess_pos = self.get_pos
            self.is_valid?(guess_pos)
        rescue 
            retry
        end
        [input[1].to_i, input[0].to_i]
    end

    def make_guess(pos)

        x, y = pos
        
            if @previous_guess.empty?

                @board.grid[x][y].turn_over
                system("clear")
                @board.render
                @previous_guess << pos

            else
                # debugger
                card1 = @board.grid[x][y]
                card2 = @board.grid[@previous_guess[0][0]][@previous_guess[0][1]]
                if  card1.face_value == card2.face_value
                    card1.turn_over
                    card2.turn_over
                    @previous_guess.pop
                else
                    @board.grid[x][y].turn_over
                    system("clear")
                    @board.render
                    sleep(3)
                    card1.hide
                    card2.hide
                    @previous_guess.pop
                end
            end
        
    end

    def is_valid?(pos)
        x, y = pos
        if @grid[x][y].revealed == true
            raise 'invalid guess'
        end
        true

    end

    def play
        @board.populate
        system("clear")
        @board.render
   
        guess_pos = self.get_pos
        
    
        make_guess(guess_pos)
        while !@board.won?
            
           
            make_guess(self.get_pos)
            system("clear")
            @board.render


        end
        return 'you win!'
    end




end