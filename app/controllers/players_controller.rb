class PlayersController < ApplicationController

  @answer_1 = nil
  @answer_2 = nil
  @answer_3 = nil
  @answer_4 = nil

  def shuffle_multiple_choice(question)
    wrong_answers = question["incorrect_answers"]
    all_answers = wrong_answers.push(question["correct_answer"])
    number = rand(all_answers.length)
    @answer_1 = HTMLEntities.new.decode(all_answers[(number)])
    all_answers.delete_at(number)
    number = rand(all_answers.length)
    @answer_2 = HTMLEntities.new.decode(all_answers[(number)])
    all_answers.delete_at(number)
    number = rand(all_answers.length)
    @answer_3 = HTMLEntities.new.decode(all_answers[(number)])
    all_answers.delete_at(number)
    number = rand(all_answers.length)
    @answer_4 = HTMLEntities.new.decode(all_answers[(number)])
    all_answers.delete_at(number)
  end

  def shuffle_true_false(question)
    wrong_answers = question["incorrect_answers"]
    all_answers = wrong_answers.push(question["correct_answer"])
    number = rand(all_answers.length)
    @answer_1 = HTMLEntities.new.decode(all_answers[(number)])
    all_answers.delete_at(number)
    number = rand(all_answers.length)
    @answer_2 = HTMLEntities.new.decode(all_answers[(number)])
    all_answers.delete_at(number)
  end


  def make_questions(player1, player2)

    nytimesarticles = Nytimes.new().get_NYT()
    question1_api = Nytimes.new().sort_us_politics(nytimesarticles)
    question1 = Question.create(question: HTMLEntities.new.decode(question1_api[3]), answer_correct: HTMLEntities.new.decode(question1_api[1]), answer_1: question1_api[4][3], answer_2: HTMLEntities.new.decode(question1_api[1]), answer_3: question1_api[4][1], answer_4: question1_api[4][2], correct_response: "Well done.", wrong_response: "Terrible.", number: 1, topic: "NYTimes", player: player1.name, correct_score: 500, incorrect_score: 0)

    # question1_api = TriviaDB.new().get_TriviaDB("General Knowledge", "easy", "True/False").first()
    # shuffle_true_false(question1_api)
    # question1 = Question.create(question: HTMLEntities.new.decode(question1_api["question"]), answer_correct: HTMLEntities.new.decode(question1_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, correct_response: "Well done.", wrong_response: "Terrible.", number: 1, topic: question1_api["category"], player: player1.name, correct_score: 1000, incorrect_score: 900)

    question2_api = TriviaDB.new().get_TriviaDB("General Knowledge", "easy", "True/False").first()
    shuffle_true_false(question2_api)
    question2 = Question.create(question: HTMLEntities.new.decode(question2_api["question"]), answer_correct: HTMLEntities.new.decode(question2_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, correct_response: "Well done.", wrong_response: "Terrible.", number: 2, topic: question2_api["category"], player: player2.name, correct_score: 500, incorrect_score: 0)

    question3_api = TriviaDB.new().get_TriviaDB("Sports", "easy", "Multiple Choice").first()
    shuffle_multiple_choice(question3_api)
    question3 = Question.create(question: HTMLEntities.new.decode(question3_api["question"]), answer_correct: HTMLEntities.new.decode(question3_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, answer_3: @answer_3, answer_4: @answer_4, correct_response: "Well done.", wrong_response: "Terrible.", number: 3, topic: question3_api["category"], player: player1.name)



    question4_api = TriviaDB.new().get_TriviaDB("Sports", "easy", "Multiple Choice").first()
    shuffle_multiple_choice(question4_api)
    question4 = Question.create(question: HTMLEntities.new.decode(question4_api["question"]), answer_correct: HTMLEntities.new.decode(question4_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, answer_3: @answer_3, answer_4: @answer_4, correct_response: "Well done.", wrong_response: "Terrible.", number: 4, topic: question4_api["category"], player: player2.name)


    question5_api = TriviaDB.new().get_TriviaDB("Science", "medium", "Multiple Choice").first()
    shuffle_multiple_choice(question5_api)
    question5 = Question.create(question: HTMLEntities.new.decode(question5_api["question"]), answer_correct: HTMLEntities.new.decode(question5_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, answer_3: @answer_3, answer_4: @answer_4, correct_response: "Well done.", wrong_response: "Terrible.", number: 5, topic: question5_api["category"], player: player1.name)


    question6_api = TriviaDB.new().get_TriviaDB("Science", "medium", "Multiple Choice").first()
    shuffle_multiple_choice(question6_api)
    question6 = Question.create(question: HTMLEntities.new.decode(question6_api["question"]), answer_correct: HTMLEntities.new.decode(question6_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, answer_3: @answer_3, answer_4: @answer_4, correct_response: "Well done.", wrong_response: "Terrible.", number: 6, topic: question6_api["category"], player: player2.name)


    question7_api = TriviaDB.new().get_TriviaDB("General Knowledge", "medium", "True/False").first()
    shuffle_true_false(question7_api)
    question7 = Question.create(question: HTMLEntities.new.decode(question7_api["question"]), answer_correct: HTMLEntities.new.decode(question7_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, correct_response: "Well done.", wrong_response: "Terrible.", number: 7, topic: question7_api["category"], player: player1.name)


    question8_api = TriviaDB.new().get_TriviaDB("General Knowledge", "medium", "True/False").first()
    shuffle_true_false(question8_api)
    question8 = Question.create(question: HTMLEntities.new.decode(question8_api["question"]), answer_correct: HTMLEntities.new.decode(question8_api["correct_answer"]), answer_1: @answer_1, answer_2: @answer_2, correct_response: "Well done.", wrong_response: "Terrible.", number: 8, topic: question8_api["category"], player: player2.name)

    question9 = Question.create(question: "bogus question", number: 9)
  end



  def index
    @player1 = (Player.find_by number:1)
    @player2 = (Player.find_by number:2)
  end

  def new
    @player = Player.new
    @number = params[:format].to_i
  end

  def create
    @player = Player.new(player_params.merge(score: 500, latest_score: 0))
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
