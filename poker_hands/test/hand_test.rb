require File.expand_path('../test_helper', __FILE__)

class TestHand < Test::Unit::TestCase

  def test_hand_has_five_cards
    hand = Hand.new("2H 3D 5S 9C KD")
    assert_equal 5, hand.card_count
  end
  
  def test_first_card_is_2H
    hand = Hand.new("2H 3D 5S 9C KD")
    assert_equal 2, hand.cards.first.value
    assert_equal "H", hand.cards.first.suit
  end
    
  def test_parse_high_card
    hand = Hand.new("2H 3D KD 5S 9C")
    assert_equal 13, hand.high_card.value
  end
  
  def test_hand_has_pair
    hand = Hand.new("2H 2D KD 5S 9C")
    assert hand.has_pair?
  end
  
  def test_hand_does_not_have_pair
    hand = Hand.new("2H 3D 4C")
    assert !hand.has_pair?
  end
  
  def test_hand_has_3_of_a_kind
    hand = Hand.new("2H 2D 2C 5S 9C")
    assert hand.has_three_of_a_kind?
  end

  def test_full_house
    hand = Hand.new("2H 2D 3S 3D 3H")
    assert hand.has_full_house?
  end

  def test_flush
    hand = Hand.new("3H 5H 6H 7H TH")
    assert hand.has_flush?
  end

  def test_four_of_a_kind
    hand = Hand.new("2C 2D 2S 2H KH")
    assert hand.has_four_of_a_kind?
  end

  def test_straight_flush
     hand = Hand.new("2C 3C 4C 5C 6C")
     assert hand.has_straight_flush?
  end

  def test_straight
     hand = Hand.new("2C 3D 4C 5D 6C")
     assert hand.has_straight?
  end
end
