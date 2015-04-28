class ReportStatusesController < ApplicationController
  before_action :set_report_status, only: [:show, :edit, :update, :destroy]

  # GET /report_statuses
  # GET /report_statuses.json
  def index
    @report_statuses = ReportStatus.all
  end

  # GET /report_statuses/1
  # GET /report_statuses/1.json
  def show
  end

  # GET /report_statuses/new
  def new
    @report_status = ReportStatus.new
  end

  # GET /report_statuses/1/edit
  def edit
  end

  # POST /report_statuses
  # POST /report_statuses.json
  def create
    @report_status = ReportStatus.new(report_status_params)

    respond_to do |format|
      if @report_status.save
        format.html { redirect_to @report_status, notice: 'Report status was successfully created.' }
        format.json { render :show, status: :created, location: @report_status }
      else
        format.html { render :new }
        format.json { render json: @report_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_statuses/1
  # PATCH/PUT /report_statuses/1.json
  def update
    respond_to do |format|
      if @report_status.update(report_status_params)
        format.html { redirect_to @report_status, notice: 'Report status was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_status }
      else
        format.html { render :edit }
        format.json { render json: @report_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_statuses/1
  # DELETE /report_statuses/1.json
  def destroy
    @report_status.destroy
    respond_to do |format|
      format.html { redirect_to report_statuses_url, notice: 'Report status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_status
      @report_status = ReportStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_status_params
      params.require(:report_status).permit(:name, :description, :is_editable, :is_active, :is_deleted, :deleted_at)
    end
end
