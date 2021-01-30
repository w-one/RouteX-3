class HomeController < ApplicationController
  
  def index
    @spots = Spot.all
  end

  def home_params
    params.require(:home).permit(:lat,:lng)
  end
end
