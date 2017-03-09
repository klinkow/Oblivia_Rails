class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @player = (Player.find_by name: @question.player)
    if (nextquestion = Question.find_by number: (@question.number + 1))
      if params[:amount_waged]
        @question.update(correct_score: params[:amount_waged].to_i, incorrect_score: -(params[:amount_waged].to_i))
        redirect_to question_path(@question)
      elsif params[:user_answer]
        if params[:user_answer] === @question.answer_correct
          new_score = @player.score + @question.correct_score
          flash[:success] = "Nice Job!"
        else
          new_score = @player.score + @question.incorrect_score
          flash[:fail] = "Incorrect"
        end
        @player.update(score: new_score)
        redirect_to question_path(nextquestion)
      end
    else
      redirect_to players_path
    end
  end
end
