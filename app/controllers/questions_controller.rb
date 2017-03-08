class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @player = (Player.find_by name: @question.player)
    nextquestion = Question.find_by number: (@question.number + 1)
    if params[:amount_waged]
      @question.correct_score = params[:amount_waged].to_i
      @question.incorrect_score = -(params[:amount_waged].to_i)
      redirect_to question_path(@question)
    elsif params[:user_answer]
      if params[:user_answer] === @question.answer_correct
        @player.score += params[:correct_score].to_i
      else
        @player.score += params[:incorrect_score].to_i
      end
    redirect_to question_path(nextquestion)
    end
  end
end
