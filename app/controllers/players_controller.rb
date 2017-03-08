class PlayersController < ApplicationController

  def make_questions(player1, player2)
    question1 = Question.create(question: "Is the capitol of Illinois Springfield?", answer_correct: "True", answer_1: "True", answer_2: "False", correct_response: "Well done.", wrong_response: "Terrible.", number: 1, topic: "geography", round: 1, player: player1.name, fitb: false, mc: false, tf: true, finished: false)
    question2 = Question.create(question: "Who framed roger rabit?", answer_correct: "Me", answer_1: "You", answer_2: "Me", answer_3: "Him", answer_4: "Her", correct_response: "Good Job.", wrong_response: "You suck.", number: 2, topic: "general knowledge", round: 1, player: player2.name, fitb: false, mc: true, tf: false, finished: false)
  end

  def index
  end

  def new
    @player = Player.new
    @number = params[:format].to_i
  end

  def create
    @player = Player.new(player_params.merge(score: 0, latest_score: 0))
    if player_params[:number] === "2"
      @player.save
      make_questions((Player.find_by number: 1), @player)
      redirect_to question_path(Question.find_by number:1)
    elsif @player.save
      redirect_to new_player_path(2)
    end
  end

end

private
  def player_params
    params.require(:player).permit(:name, :number, :color, :nerd_type, :score, :latest_score, :format)
  end
