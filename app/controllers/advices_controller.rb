class AdvicesController < ApplicationController
  before_action :authenticate_user!

  def create
    how_to = HowTo.find(params[:how_to_id])
    advice = how_to.advices.build(advice_params)
    advice.user_id = current_user.id
    if advice.save
      flash.now[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @advice = Advice.find(params[:id])
    if @advice.destroy
      flash[:success] = "コメントを削除しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントを削除できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end
    
  private

    def advice_params
      params.require(:advice).permit(:content)
    end
end
