class RoundsController < ApplicationController
  def index
    Player.destroy_all
    Question.destroy_all
  end


end
