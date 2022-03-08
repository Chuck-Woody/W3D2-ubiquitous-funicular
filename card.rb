
class Card

    FACE_VALUE = ["1","2","3","4","5","6","7","8"]

    def initialize(revealed)
        @face_value = FACE_VALUE.sample
        @revealed = revealed
    end

    def face_value
        @face_value if @revealed 
    end

    def reveal
        @revealed = true
    end

    def hide
        @revealed = false
    end




end

b = Card.new(false)
a = Card.new(true)
p a.face_value
p b.face_value
p b.reveal
p b.face_value