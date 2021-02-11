class HowTosController < ApplicationController
  layout 'how_to'
  
  def index
    if params[:search] == nil
      @how_tos= HowTo.all.page(params[:page]).per(15)
    elsif params[:search] == ''
      @how_tos= HowTo.all.page(params[:page]).per(15)
    else
      @how_tos = HowTo.where("title LIKE ? ",'%' + params[:search] + '%').or(HowTo.where("content LIKE ? ", "%" + params[:search] + "%")).page(params[:page]).per(15)
    end
  end

  def new
    @how_to = HowTo.new
  end

  def create
    @how_to = HowTo.new(how_to_params)
    @how_to.user_id = current_user.id
    if @how_to.save
      redirect_to :action => "index"
    else
      render "new"
    end
  end

  def show
    @how_to = HowTo.find(params[:id])
    @advices = @how_to.advices
    @advice = Advice.new
  end

  def edit
    @how_to = HowTo.find(params[:id])
  end

  def update
    @how_to = HowTo.find(params[:id])
    if @how_to.update(how_to_params)
      redirect_to :action => "show", :id => how_to.id
    else
      render "edit"
    end
  end

  def destroy
    how_to = HowTo.find(params[:id])
    how_to.destroy
    redirect_to action: :index
  end

  

  private

  def how_to_params
    params.require(:how_to).permit(:title, :content, :image, :video)
  end

end
