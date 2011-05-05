class Game
  attr_reader :players	

  def add_player(player)
    if players.nil? 
    	@players=Array.new	
    end
    @players = @players.push player 
  end
  
  def winner
  # sort players by hand ranking
    if are_hands_the_same?          
     	return highest_card_wins
    else 
    	return @players.sort_by(&:handrank).last
    end
  end
  
  def are_hands_the_same?
     @players.first.handrank == @players.last.handrank
  end
  
  def highest_card_wins     
     4.downto(0) { |i|       
      if @players.first.hand.sorted_cards_by_value[i].value == @players.last.hand.sorted_cards_by_value[i].value
      #  puts "continue: cards are the same"      	
      elsif @players.first.hand.sorted_cards_by_value[i].value > @players.last.hand.sorted_cards_by_value[i].value 
      #  puts "first player wins"
      	return @players.first
      else
      #  puts "second player wins"  
        return @players.last
      end
      }     
    return nil
  end
end
