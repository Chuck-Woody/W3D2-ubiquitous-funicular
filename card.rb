
class Card   

    FACE_VALUE = ('a'..'z').to_a
    attr_reader :revealed
    def self.shuffle(num_pairs)
        arr = FACE_VALUE.shuffle
        cards = []
            num_pairs.times do 
                pot_card_value = arr.pop 
                card1 = Card.new(pot_card_value)
                card2 = Card.new(pot_card_value)
                cards.concat([card1, card2])
            end
        return cards.shuffle
    end

    def initialize(value, revealed=false)
        @face_value = value
        @revealed = revealed
    end

    def face_value
        @face_value 
    end

    

    def turn_over
        @revealed = true
    end

    def hide
        @revealed = false
    end

end

# b = Card.new(false)
# a = Card.new(true)
# p a.face_value
# p b.face_value

# p b.face_value