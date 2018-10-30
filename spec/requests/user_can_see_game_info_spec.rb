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

describe 'POST /api/v1/games/:id/plays' do
  it 'can post game info' do
    josh = User.create(id: 1, name: "Josh")
    sal = User.create(id: 2, name: "Sal")
    game = Game.create(player_1: josh, player_2: sal)

    josh.plays.create(game: game, word: "sal", score: 3)
    josh.plays.create(game: game, word: "zoo", score: 12)
    sal.plays.create(game: game, word: "josh", score: 14)
    sal.plays.create(game: game, word: "no", score: 2)

    user_id = 1
    word = 'at'

    post "/api/v1/games/#{game.id}/plays?user_id=#{user_id}&word=#{word}"

    expect(response.status).to eq(201)

    get "/api/v1/games/#{game.id}"

    expect(response).to be_successful

    game = JSON.parse(response.body, symbolize_names: true)

    return_json = {
      "game_id":1,
      "scores": [
        {
          "user_id":1,
          "score":17
        },
        {
          "user_id":2,
          "score":16
        }
      ]
    }
 
    expect(game).to eq(return_json)
  end
end
