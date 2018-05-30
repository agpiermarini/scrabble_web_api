require 'rails_helper'

describe 'User' do
  describe 'sends a post request to the game score endpoint' do
      it 'returns a 201 created response' do
      user_1 = create(:user)
      user_2 = create(:user)

      game = create(:game, id: 1, player_1_id: user_1.id, player_2_id: user_2.id)

      user_1.plays.create!(game_id: game.id, word: "hello")
      user_2.plays.create!(game_id: game.id, word: "hello")

      post "/api/v1/games/1/plays?user_id=1&word=at"

      expect(response.status).to be 201

      get '/api/v1/games/1'

      info = JSON.parse(response.body, symbolize_names: true)

      expect(info).to be_a Hash
      expect(info[:game_id]).to eq(game.id)
      expect(info[:scores]).to be_an Array
      expect(info[:scores].length).to eq(2)

      expect(info[:scores][0]).to be_a Hash
      expect(info[:scores][0][:user_id]).to eq(1)
      expect(info[:scores][0][:score]).to eq(10)

      expect(info[:scores][1]).to be_a Hash
      expect(info[:scores][1][:user_id]).to eq(2)
      expect(info[:scores][1][:score]).to eq(8)
    end
  end
end
# Background: This story assumes the base data from running `rake db:seed`
#
# You can choose to send the user_id and word specified below however you'd like or are comfortable.
#
# When I send a POST request to "/api/v1/games/1/plays" with a user_id=1 and word=at
# Then I should receive a 201 Created Response
#
# When I send a GET request to "/api/v1/games/1" I receive a JSON response as follows:
#
# {
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":17
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }
