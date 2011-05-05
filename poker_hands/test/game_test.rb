require File.expand_path('../test_helper', __FILE__)
class TestGame < Test::Unit::TestCase
  def test_initialize
      playerw = Player.new("White: 2C 3H 4S 8C AH")
      playerb = Player.new("Black: 2H 4S 4C 2D 4H")
      game = Game.new
      game.add_player playerw
      game.add_player playerb
      assert_equal 2, game.players.count
  end
  
  def test_full_house__wins
	playerw = Player.new("White: 2C 3H 4S 8C AH")
	playerb = Player.new("Black: 2H 4S 4C 2D 4H")
	game = Game.new
	game.add_player playerw
      	game.add_player playerb
      	assert_equal playerb, game.winner
  end
  
  def test_black_wins_with_high_card_nine
  	playerw = Player.new("White: 2C 3H 4S 8C KH")
  	playerb = Player.new("Black: 2H 3D 5S 9C KD")
  	game = Game.new
  	game.add_player playerw
        game.add_player playerb
      	assert_equal playerb, game.winner
      	assert_equal "Black wins. - with high card: 9", game.winning_message
  end
  
  def test_ace_high_wins
	winner = Player.new("White: 2C 3H 4S 8C AH")
	loser = Player.new("Black: 2H 3D 5S 9C KD")
	game = Game.new
	game.add_player winner
	game.add_player loser
      	assert_equal winner, game.winner
      	assert_equal "White wins. - with high card: Ace", game.winning_message
  end
  
  def test_flush_wins
  	winner = Player.new("White: 2S 8S AS QS 3S")
  	loser = Player.new("Black: 2H 4S 4C 2D 4H")
  	game = Game.new
  	game.add_player winner
  	game.add_player loser
        assert_equal winner, game.winner
        assert_equal "White wins. - with flush", game.winning_message
  end
  
  def test_no_winner
  	persona = Player.new("White: 2D 3H 5C 9S KH")
    	personb = Player.new("Black: 2H 3D 5S 9C KD")
    	game = Game.new
    	game.add_player persona
    	game.add_player personb
        assert_equal nil, game.winner
        assert_equal "Tie.", game.winning_message
  end
  
  
end
