class Guess

def initialize (response,card)
@card = card
@response = response
end

    def card
      @card
    end

    def response
      @response
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
