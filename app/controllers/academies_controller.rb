class AcademiesController < ApplicationController
  before_action :set_academy, only: [:show, :edit, :update, :destroy]

  # GET /academies/new
  def new
    @academy = Academy.new
  end

  # POST /academies
  # POST /academies.json
  def create
    @academy = Academy.new(academy_params)

    respond_to do |format|
      if @academy.save
        format.html { redirect_to items_url, notice: 'Academy was successfully created.' }
        format.json { render :show, status: :created, location: @academy }
      else
        format.html { render :new }
        format.json { render json: @academy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academies/1
  # DELETE /academies/1.json
  def destroy
    @academy.destroy
    respond_to do |format|
      format.html { redirect_to academies_url, notice: 'Academy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academy
      @academy = Academy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_params
      params.require(:academy).permit(:name)
    end
end
