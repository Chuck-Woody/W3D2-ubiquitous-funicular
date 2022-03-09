require_relative 'board.rb'
require_relative 'card.rb'


class Game

    def initialize
        @board = Board.new
        @previous_guess = []

    end

    def get_pos
        puts 'Please enter the position of the card you would like to flip (e.g., "2,3"'
    input = gets.chomp.split(',')

        [input[0].to_i, input[1].to_i]
    end

    def make_guess(pos)

        x,y = pos

        if @previous_guess.length < 1

            self.board.grid[x][y].turn_over
            self.board.render
            @previous_guess << pos

        else
            card1 = self.board.grid[x][y]
            card2 = self.board.grid[@previous_guess[0][0]][@previous_guess[0][1]]
            if  card1 == card2
                card1.turn_over
                card2.turn_over
                @previous_guess.pop
            else
                card1.hide
                card2.hide
                @previous_guess.pop
            end
        end

    end

    def play

        @board.render

        guest_pos = self.get_pos

        # @previous_guess << guest_pos

        make_guess(@guest_pos)


    end


end