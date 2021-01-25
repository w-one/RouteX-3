class FightsController < ApplicationController
  
  def create
    fight = current_user.fights.create(how_to_id: params[:how_to_id]) 
    redirect_back(fallback_location: root_path)
  end

  def destroy
    fight = Fight.find_by(how_to_id: params[:how_to_id], user_id: current_user.id)
    fight.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
