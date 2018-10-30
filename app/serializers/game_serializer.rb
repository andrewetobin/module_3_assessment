class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [{
      "user_id" => object.player_1_id,
      "score" => player_1_score
    },
    {
      "user_id" => object.player_2_id,
      "score" => player_2_score
    }
    ]
  end

  def player_1_score
    User.find(object.player_1_id).plays.sum(:score)
  end

  def player_2_score
    User.find(object.player_2_id).plays.sum(:score)
  end
end
