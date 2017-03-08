class PlayersController < ApplicationController

  def make_questions(player1, player2)
    question1_api = TriviaDB.new().get_TriviaDB("General Knowledge", "easy", "True/False").first()
    question2_api = TriviaDB.new().get_TriviaDB("General Knowledge", "easy", "True/False")

    question1_question = HTMLEntities.new.decode(question1_api["question"])

    question1 = Question.create(question: question1_question, answer_correct: "True", answer_1: "True", answer_2: "False", correct_response: "Well done.", wrong_response: "Terrible.", number: 1, topic: "geography", player: player1.name, correct_score: 1000, incorrect_score: 900)
    binding.pry
    question2 = Question.create(question: "Who framed roger rabit?", answer_correct: "Me", answer_1: "You", answer_2: "Me", answer_3: "Him", answer_4: "Her", correct_response: "Good Job.", wrong_response: "You suck.", number: 2, topic: "general knowledge", player: player2.name)
    question3 = Question.create(question: "Where in the world is carmen san diego?", answer_correct: "San Diego", answer_1: "Carmen", answer_2: "Hell", answer_3: "San Diego", answer_4: "Springfield", correct_response: "Well done.", wrong_response: "Terrible.", number: 3, topic: "geography", player: player1.name, correct_score: 1000, incorrect_score: 900)
    question4 = Question.create(question: "Where is Lucifer?", answer_correct: "Hell", answer_1: "Carmen", answer_2: "Hell", answer_3: "San Diego", answer_4: "Springfield", correct_response: "Well done.", wrong_response: "Terrible.", number: 4, topic: "geography", player: player2.name, correct_score: 1000, incorrect_score: 900)



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
      make_questions((Player.find_by number:1), @player)
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
