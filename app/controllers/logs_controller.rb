class LogsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_log, only: [:show, :edit, :update, :destroy, :checkin]
  before_action :check_login

  # GET /logs
  # GET /logs.json

  def index
    @logs = Log.all
    @logs = @logs.map do |log|
      populate_log log
    end
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    # Calles the populate log method but only for the one log
    @log = populate_log @log
  end

  # GET /logs/new
  def new

    User.token = session[:token]
    @items = Item.all
    @borrowers = User.all
    @log = Log.new
    @tomorrow = Date.current.tomorrow
  end

  # GET /logs/1/edit
  def checkin
    @log.returned_to_id = current_user.id
    @log.return_date = DateTime.now
    if @log.save
      # message checkin complete
    else
      # message checkin failed
    end

    redirect_to logs_path
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(log_params)
    puts params[:due_date]

    # Current user checks out
    if current_user
      @log.lender_id = current_user.id
    end

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])

    end

    def populate_log log

      # populate the user info
      log.lender = User.find log.lender_id
      log.borrower = User.find log.borrower_id

      if log.returned_to_id
        log.returned_to = User.find log.returned_to_id
      end
      
      return log
    end
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:item_id, :return_date, :borrower_id, :returned_to_id, :lender_id, :due_date)
    end
end
