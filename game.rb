require_relative 'board.rb'
require_relative 'card.rb'


class Game

    def initialize
        @board = Board.new


    end

    def get_pos
        puts 'Please enter the position of the card you would like to flip (e.g., "2,3"'
    input = gets.chomp.split(',')

        [input[0].to_i, input[1].to_i]
    end

    def play
        

    end


end