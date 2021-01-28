class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def create
    note = Note.find(params[:note_id])
    question = note.questions.build(question_params)
    question.user_id = current_user.id
    if question.save
      flash.now[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "コメントを削除しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントを削除できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
    
  private

    def question_params
      params.require(:question).permit(:content)
    end

end
