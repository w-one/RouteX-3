class NotesController < ApplicationController
  layout 'note'

  def index
    if params[:search] == nil
      @notes= Note.all.page(params[:page]).per(20)
    elsif params[:search] == ''
      @notes= Note.all.page(params[:page]).per(20)
    else
      @notes = Note.where("title LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(20)
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to :action => "index"
    else
      render "new"
    end
  end

  def show
    @note = Note.find(params[:id])
    @questions = @note.questions
    @question = Question.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to :action => "show", :id => note.id
    else
      render "edit"
    end
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to action: :index
  end


  private

  def note_params
    params.require(:note).permit(:title, :content)
  end

end
