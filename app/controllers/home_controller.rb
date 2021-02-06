class HomeController < ApplicationController
  
  def index
    @spots = Spot.all.page(params[:page]).per(3)
    @how_tos = HowTo.all.page(params[:page]).per(3)
    @notes = Note.all.page(params[:page]).per(3)
  end

  def home_params
    params.require(:home).permit(:lat,:lng)
  end
end
