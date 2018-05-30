class GameScore
  def initialize(game)
    @game = game
  end

  def score
    {
        "game_id": game.id,
        "scores": [
        {
          "user_id": game.player_1_id,
          "score": calculate_score(game.player_1)
        },
        {
          "user_id": game.player_2_id,
          "score": calculate_score(game.player_2)
        }
      ]
    }

  end

  private
    attr_reader :game

    def calculate_score(player)
      player.plays.sum(:score)
    end

end
