class RoundsController < ApplicationController
  def index
    Player.destroy_all
    @player1 = Player.create(name: "Player1", number: 1, score: 0, latest_score: 0)
    @player2 = Player.create(name: "Player2", number: 2, score: 0, latest_score: 0)
  end


end
