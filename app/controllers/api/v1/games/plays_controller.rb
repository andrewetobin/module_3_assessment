class Api::V1::Games::PlaysController < ApplicationController

  def create
    play = Play.create(game_id: params[:game_id], user_id: params[:user_id], word: params[:word])
    render status: 201, json: Game.find(params[:game_id])
  end
end
