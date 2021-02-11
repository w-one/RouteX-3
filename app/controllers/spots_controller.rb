class SpotsController < ApplicationController
  layout 'spot'

  def index
    if params[:search] == nil
      @spots= Spot.all.page(params[:page]).per(6)
    elsif params[:search] == ''
      @spots= Spot.all.page(params[:page]).per(6)
    else
      @spots = Spot.where("title LIKE ? ",'%' + params[:search] + '%').or(Spot.where("text LIKE ? ", "%" + params[:search] + "%")).page(params[:page]).per(6)
    end
    @spots = params[:tag_id].present? ? Tag.find(params[:tag_id]).spots : Spot.all.page(params[:page]).per(6)
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    if @spot.save
      redirect_to :action => "index"
    else
      render "new"
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
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to :action => "show", :id => @spot.id
    else
      render "edit"
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to action: :index
  end


  private

  def spot_params
    params.require(:spot).permit(:title, :text, :image, :image2, :image3, :remove_image, :remove_image2, :remove_image3, :lat, :lng, tag_ids: [])
  end
  
end

