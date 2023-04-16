class BlindDatesController < ApplicationController

  include BlindDatesHelper
  before_action :authenticate_employee!
  before_action :set_blind_date, only: %i[ show edit update destroy ]

  def index
    @last = request.url.to_s.split("/").last
    if @last == "past_dates"
      if current_employee.role == 'admin'
        @blind_dates = BlindDate.all.order(id: :desc)
      else
        @blind_dates = BlindDate.where(teams: current_employee.teams)
      end
    else
      @blind_dates = BlindDate.specific_date(friday_date).all
    end
  end

  def show
  end

  def new
    begin
      service = CreateDatesService.new(friday_time_12).call
      redirect_to blind_dates_url, notice: "Blind dates was successfully created."
    rescue StandardError => e
      redirect_to blind_dates_url, notice: e
    end
  end

  def edit
  end

  def create
    @blind_date = BlindDate.new(blind_date_params)

    respond_to do |format|
      if @blind_date.save
        format.html { redirect_to blind_date_url(@blind_date), notice: "Blind date was successfully created." }
        format.json { render :show, status: :created, location: @blind_date }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blind_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blind_dates/1 or /blind_dates/1.json
  def update
    respond_to do |format|
      if @blind_date.update(blind_date_params)
        format.html { redirect_to blind_date_url(@blind_date), notice: "Blind date was successfully updated." }
        format.json { render :show, status: :ok, location: @blind_date }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blind_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blind_dates/1 or /blind_dates/1.json
  def destroy
    @blind_date.destroy

    respond_to do |format|
      format.html { redirect_to blind_dates_url, notice: "Blind date was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blind_date
      @blind_date = BlindDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blind_date_params
      params.require(:blind_date).permit(:team_id, :date, :restaurant)
    end
end
