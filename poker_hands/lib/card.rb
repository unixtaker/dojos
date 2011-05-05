class Card
  attr_reader :value
  attr_reader :suit
  
  VALUES = "23456789TJQKA"
  
  def initialize(face)
    @value = parse_card_value(face[0])
    @suit = face[1]
  end
  
  def friendly_name       
    case 
    when @value < 10
    @value.to_s
    when @value == 11
    "Jack"
    when @value == 12
    "Queen"
    when @value == 13
    "King"
    when @value == 14
    "Ace"
    end
  end
  
  private
    def parse_card_value(value)
      raise StandardError, "Invalid Value" if VALUES.index(value).nil? 
      VALUES.index(value) +2
    end 
end
