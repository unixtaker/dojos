class PokerSet
  NONE = 0x00
  ONE_PAIR = 0x01
  TWO_PAIR = 0x02
  THREE_OF_A_KIND = 0x04
  STRAIGHT = 0x08
  FULL_HOUSE = 0x10
  FLUSH = 0x20  
  FOUR_OF_A_KIND = 0x40
  STRAIGHT_FLUSH = 0x80
end

class Hand
  attr_reader :cards  
  
  def initialize(cards)
    @cards = cards.split(" ").map {|c| Card.new(c)}
  end
  
  def card_count
    @cards.count  
  end
  
  def high_card
    sorted_cards_by_value.last
  end
  
  def sorted_cards_by_value
     @cards.sort_by(&:value)
  end
  
  def has_pair?
    set_of?(2) 
  end
  
  def has_two_pair?
    set_of_count(2).count>1
  end
  
  def has_three_of_a_kind?
    set_of?(3)
  end
  
  def has_full_house?
    set_of?(2) && set_of?(3)
  end
 
  def has_flush?
    suit_check = @cards.first.suit
    @cards.each do |c|
	if c.suit != suit_check
		return false
	end
    end
  end

  def has_straight?
    start_check = 0
    @cards.sort_by(&:value).each do |c| 
      if start_check == 0 
        start_check = c.value
      else
        if c.value - 1 != start_check 
		return false
	end
      end
    start_check = c.value
    
    end
  end

  def has_four_of_a_kind?
    set_of?(4)
  end

  def has_straight_flush?
     has_straight? && has_flush?
  end
  
  def rank_hand_set    
     if has_straight_flush? 
       return PokerSet::STRAIGHT_FLUSH
     elsif has_four_of_a_kind?
       return PokerSet::FOUR_OF_A_KIND
     elsif has_full_house?
       return PokerSet::FULL_HOUSE
     elsif has_flush?
       return PokerSet::FLUSH
     elsif has_straight?
       return PokerSet::STRAIGHT
     elsif has_three_of_a_kind?
       return PokerSet::THREE_OF_A_KIND
     elsif has_two_pair?
       return PokerSet::TWO_PAIR
     elsif has_pair? 
       return PokerSet::PAIR              
     end
     return PokerSet::NONE
  end
  
  private
  
  
  
  def set_of?(count)
    same_card_set.values.select{|v| v == count}.any?
  end
  
  def set_of_count(count)
     same_card_set.values.select{|v| v == count}
  end
  
  
  def same_card_set
    card_values={}
    @cards.each do |c| 
      card_values[c.value] ||= 0
      card_values[c.value] +=1
    end
    card_values
    
  end
  
end
