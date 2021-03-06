class Question < ApplicationRecord
  store :answers_all, accessors: [ :answer_1, :answer_2, :answer_3, :answer_4 ]

  def generate(player1, player2)
    question1 = Question.create(question: "Is the capitol of Illinois Springfield?", answer_correct: "True", answer_1: "True", answer_2: "False", correct_response: "Well done.", wrong_response: "Terrible.", number: 1, topic: "geography", round: 1, player: player1.name, fitb: false, mc: false, tf: true, finished?: false)
    question2 = Question.create(question: "Who framed roger rabit?", answer_correct: "Me", answer_1: "You", answer_2: "Me", answer_3: "Him", answer_4: "Her", correct_response: "Good Job.", wrong_response: "You suck.", number: 2, topic: "general knowledge", round: 1, player: player2.name, fitb: false, mc: true, tf: false, finished?: false)
  end

end
