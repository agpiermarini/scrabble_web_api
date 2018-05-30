require 'rails_helper'

describe 'User' do
  describe 'sends a get request to the game score endpoint' do
    it 'returns appropriate json response' do
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
