class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    spot = Spot.find(params[:spot_id])
    comment = spot.comments.build(comment_params)
    comment.user_id = current_user.id
    if comment.save
      flash.now[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "コメントを削除しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントを削除できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end


  private

    def comment_params
      params.require(:comment).permit(:content, :rate)
    end
end
