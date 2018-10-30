require 'rails_helper'

describe "GET '/api/v1/games/1'" do
  it 'can send game info' do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")

    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    get "/api/v1/games/#{game.id}"

    expect(response).to be_successful

    score = JSON.parse(response.body, symbolize_names: true)

    return_json =  {
      "game_id": 1,
      "scores": [
        {
          "user_id":1,
          "score":15
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    }

    expect(score).to eq(return_json)
  end
end
