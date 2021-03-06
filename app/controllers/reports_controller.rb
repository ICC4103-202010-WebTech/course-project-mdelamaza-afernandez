class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show

    @report = Report.where(event_id: params[:event_id])

      #@report = Report.where(event_id: params[:event_id])
    #@reporto = Report.where(organization_id: params[:organization_id])
    #@reportu = Report.where(user_id: params[:user_id])


  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save!
        flash[:notice] = "Report was successfully created."
        format.html { redirect_to Event.where(id: @report.event_id).first}#, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        flash[:notice] = "Report was successfully created."
        format.html { redirect_to Event.where(id: @report.event_id).first}#, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        flash[:alert] = "Uups! An error ocurred. Try again later"
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      flash[:notice] = "Report was successfully destroyed."
      format.html { redirect_to Event.where(id: @report.event_id).first}#, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.fetch(:report, {}).permit(:user_id,:event_id,:description)
    end

end
