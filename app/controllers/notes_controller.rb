class NotesController < ApplicationController
  
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    if note.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @note = Note.find(params[:id])
    # @questions = @note.questions
    # @question = Question.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    if note.update(note_params)
      redirect_to :action => "show", :id => note.id
    else
      redirect_to :action => "edit"
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
