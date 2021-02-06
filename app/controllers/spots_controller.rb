class SpotsController < ApplicationController
  layout 'spot'

  def index
    @spots = params[:tag_id].present? ? Tag.find(params[:tag_id]).spots : Spot.all
  end

  def new
    @spot = Spot.new
  end

  def create
    spot = Spot.new(spot_params)
    spot.user_id = current_user.id
    if spot.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @comments = @spot.comments
    @comment = Comment.new
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    spot = Spot.find(params[:id])
    if spot.update(spot_params)
      redirect_to :action => "show", :id => spot.id
    else
      redirect_to :action => "edit"
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to action: :index
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :text, :image, :lat, :lng, tag_ids: [])
  end
  
end

