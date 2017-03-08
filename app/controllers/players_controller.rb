class PlayersController < ApplicationController

  def generate(player1, player2)
    question1 = Question.create(question: "Is the capitol of Illinois Springfield?", answer_correct: "True", answer_1: "True", answer_2: "False", correct_response: "Well done.", wrong_response: "Terrible.", number: 1, topic: "geography", round: 1, player: player1.name, fitb: false, mc: false, tf: true, finished?: false)
    question2 = Question.create(question: "Who framed roger rabit?", answer_correct: "Me", answer_1: "You", answer_2: "Me", answer_3: "Him", answer_4: "Her", correct_response: "Good Job.", wrong_response: "You suck.", number: 2, topic: "general knowledge", round: 1, player: player2.name, fitb: false, mc: true, tf: false, finished?: false)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if params[:format] === 2
      @player.save
      redirect_to question_path(2)
    elsif @player.save
      redirect_to new_player_path(2)
    end
  end

  def update
    @player = Player.find_by number: (params[:format])
    @player.update(player_params)
    if @player.number === 1
      redirect_to player_path(Player.find_by number: 2)
    elsif @player.number === 2
      generate(Player.find_by number: 1, @player)
      redirect_to question_path(question1)
    else
    end
  end
end
