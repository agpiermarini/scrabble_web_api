class Api::V1::Games::PlaysController < ActionController::API
  def create
    require 'pry'; binding.pry
    User.find(params[:user_id]).plays.create!(game_id: params[:id], word: params[:word])
    render status: 201
  end
end
