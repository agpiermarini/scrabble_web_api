require 'rails_helper'

describe 'User' do
  describe 'sends a get request to the game score endpoint' do
    it 'returns appropriate json response' do
    user_1 = create(:user)
    user_2 = create(:user)

    game = create(:game, id: 1, player_1_id: user_1.id, player_2_id: user_2.id)

    user_1.plays.create!(game_id: game.id, word: "hello")
    user_2.plays.create!(game_id: game.id, word: "hello")

    get '/api/v1/games/1'

    info = JSON.parse(response.body, symbolize_names: true)

    require 'pry'; binding.pry

#       Background: This story assumes the base data from running `rake db:seed`
#
# When I send a GET request to "/api/v1/games/1" I receive a JSON response as follows:
#
# {
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }
    end
  end
end
