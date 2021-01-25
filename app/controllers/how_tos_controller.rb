class HowTosController < ApplicationController
  before_action :set_how_to, only: %i[ show edit update destroy ]

  # GET /how_tos or /how_tos.json
  def index
    @how_tos = HowTo.all
  end

  # GET /how_tos/1 or /how_tos/1.json
  def show
  end

  # GET /how_tos/new
  def new
    @how_to = HowTo.new
  end

  # GET /how_tos/1/edit
  def edit
  end

  # POST /how_tos or /how_tos.json
  def create
    @how_to = HowTo.new(how_to_params)
    @how_to.user_id = current_user.id
    respond_to do |format|
      if @how_to.save
        format.html { redirect_to @how_to, notice: "How to was successfully created." }
        format.json { render :show, status: :created, location: @how_to }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @how_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /how_tos/1 or /how_tos/1.json
  def update
    respond_to do |format|
      if @how_to.update(how_to_params)
        format.html { redirect_to @how_to, notice: "How to was successfully updated." }
        format.json { render :show, status: :ok, location: @how_to }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @how_to.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /how_tos/1 or /how_tos/1.json
  def destroy
    @how_to.destroy
    respond_to do |format|
      format.html { redirect_to how_tos_url, notice: "How to was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_how_to
      @how_to = HowTo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def how_to_params
      params.require(:how_to).permit(:user_id, :title, :content, :video, :image)
    end
end
