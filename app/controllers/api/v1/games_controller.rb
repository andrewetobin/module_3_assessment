class Api::V1::GamesController < ApplicationController

  def show
    game_info = Game.find(params[:game_id])

    render json: game_info
  end

end
