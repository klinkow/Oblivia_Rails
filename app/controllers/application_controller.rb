class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


    @@player1 = Player.find_by number: 1
    @@player2 = Player.find_by number: 2


end
