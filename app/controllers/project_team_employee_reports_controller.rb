class ProjectTeamEmployeeReportsController < ApplicationController
  before_action :set_project_team_employee_report, only: [:show, :edit, :update, :destroy]

  # GET /project_team_employee_reports
  # GET /project_team_employee_reports.json
  def index
    @project_team_employee_reports = ProjectTeamEmployeeReport.all
  end

  # GET /project_team_employee_reports/1
  # GET /project_team_employee_reports/1.json
  def show
  end

  # GET /project_team_employee_reports/new
  def new
    @project_team_employee_report = ProjectTeamEmployeeReport.new
  end

  # GET /project_team_employee_reports/1/edit
  def edit
  end

  # POST /project_team_employee_reports
  # POST /project_team_employee_reports.json
  def create
    @project_team_employee_report = ProjectTeamEmployeeReport.new(project_team_employee_report_params)

    respond_to do |format|
      if @project_team_employee_report.save
        format.html { redirect_to @project_team_employee_report, notice: 'Project team employee report was successfully created.' }
        format.json { render :show, status: :created, location: @project_team_employee_report }
      else
        format.html { render :new }
        format.json { render json: @project_team_employee_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_team_employee_reports/1
  # PATCH/PUT /project_team_employee_reports/1.json
  def update
    respond_to do |format|
      if @project_team_employee_report.update(project_team_employee_report_params)
        format.html { redirect_to @project_team_employee_report, notice: 'Project team employee report was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_team_employee_report }
      else
        format.html { render :edit }
        format.json { render json: @project_team_employee_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_team_employee_reports/1
  # DELETE /project_team_employee_reports/1.json
  def destroy
    @project_team_employee_report.destroy
    respond_to do |format|
      format.html { redirect_to project_team_employee_reports_url, notice: 'Project team employee report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_team_employee_report
      @project_team_employee_report = ProjectTeamEmployeeReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_team_employee_report_params
      params.require(:project_team_employee_report).permit(:name, :start_date, :end_date, :report_status_id, :employee_id, :employee_type, :project_id, :project_type, :project_team_id, :project_team_type, :project_team_role_id, :project_team_role_type)
    end
end
