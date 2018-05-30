class Api::V1::Games::GamesController < ActionController::API
  def show
    game = Game.find(params[:id])
    game_score = GameScore.new(game)
    render json: game_score.score
  end
end
