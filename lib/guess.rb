require_relative "card"
require_relative "deck"
require_relative "round"

class Guess

attr_reader :response, :card

def initialize (response,card)
@card = card
@response = response
end

    def correct?
      @response == card.answer
    end

    def feedback
      if correct? == true
        "Correct"
      else
        @correct = false
        "Wrong"
      end
    end

end
