class Api::V1::Games::PlaysController < ActionController::API
  def create
    word = WordSearch.new(params[:word]).word
    if word.inflection
      User.find(params[:user_id]).plays.create!(game_id: params[:id], word: params[:word])
      render status: 201
    else
      message = {message: "#{params[:word]} is not a valid word."}
      render json: message
    end
  end
end
