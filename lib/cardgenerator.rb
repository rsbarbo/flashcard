
require_relative "card"


class CardGenerator

attr_reader :filename

def initialize(filename)
  @filename = File.read(filename)
end

def cards
end


end
