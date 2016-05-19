require_relative "card"
require_relative "deck"
require_relative "round"

class Guess

attr_reader :response,
            :card,
            :feedback

def initialize (response,card)
    @card     = card
    @response = response
end

    def correct?
        @response == card.answer
    end

    def feedback
     if @response == card.answer
          "Correct"
        else
          "Wrong"
        end
    end

end
