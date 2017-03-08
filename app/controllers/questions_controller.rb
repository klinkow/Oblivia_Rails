class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @player = Player.find_by number: @question.player
    if params[:user_answer] === @question.answer_correct
      @player.score += params[:correct_score]
    else
      @player.score += params[:incorrect_score]
    end
  end
end
