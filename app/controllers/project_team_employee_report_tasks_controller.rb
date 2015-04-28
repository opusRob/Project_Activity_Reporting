class ProjectTeamEmployeeReportTasksController < ApplicationController
  before_action :set_project_team_employee_report_task, only: [:show, :edit, :update, :destroy]

  # GET /project_team_employee_report_tasks
  # GET /project_team_employee_report_tasks.json
  def index
    @project_team_employee_report_tasks = ProjectTeamEmployeeReportTask.all
  end

  # GET /project_team_employee_report_tasks/1
  # GET /project_team_employee_report_tasks/1.json
  def show
  end

  # GET /project_team_employee_report_tasks/new
  def new
    @project_team_employee_report_task = ProjectTeamEmployeeReportTask.new
  end

  # GET /project_team_employee_report_tasks/1/edit
  def edit
  end

  # POST /project_team_employee_report_tasks
  # POST /project_team_employee_report_tasks.json
  def create
    @project_team_employee_report_task = ProjectTeamEmployeeReportTask.new(project_team_employee_report_task_params)

    respond_to do |format|
      if @project_team_employee_report_task.save
        format.html { redirect_to @project_team_employee_report_task, notice: 'Project team employee report task was successfully created.' }
        format.json { render :show, status: :created, location: @project_team_employee_report_task }
      else
        format.html { render :new }
        format.json { render json: @project_team_employee_report_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_team_employee_report_tasks/1
  # PATCH/PUT /project_team_employee_report_tasks/1.json
  def update
    respond_to do |format|
      if @project_team_employee_report_task.update(project_team_employee_report_task_params)
        format.html { redirect_to @project_team_employee_report_task, notice: 'Project team employee report task was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_team_employee_report_task }
      else
        format.html { render :edit }
        format.json { render json: @project_team_employee_report_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_team_employee_report_tasks/1
  # DELETE /project_team_employee_report_tasks/1.json
  def destroy
    @project_team_employee_report_task.destroy
    respond_to do |format|
      format.html { redirect_to project_team_employee_report_tasks_url, notice: 'Project team employee report task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_team_employee_report_task
      @project_team_employee_report_task = ProjectTeamEmployeeReportTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_team_employee_report_task_params
      params.require(:project_team_employee_report_task).permit(:project_team_employee_report_id, :work_date, :work_hours, :task_id, :application_id, :release_id, :build_id, :created_by, :updated_by)
    end
end
