class ProjectTeamEmployeesController < ApplicationController
  before_action :set_project_team_employee, only: [:show, :edit, :update, :destroy]

  # GET /project_team_employees
  # GET /project_team_employees.json
  def index
    @project_team_employees = ProjectTeamEmployee.all
  end

  # GET /project_team_employees/1
  # GET /project_team_employees/1.json
  def show
  end

  # GET /project_team_employees/new
  def new
    @project_team_employee = ProjectTeamEmployee.new
  end

  # GET /project_team_employees/1/edit
  def edit
  end

  # POST /project_team_employees
  # POST /project_team_employees.json
  def create
    @project_team_employee = ProjectTeamEmployee.new(project_team_employee_params)

    respond_to do |format|
      if @project_team_employee.save
        format.html { redirect_to @project_team_employee, notice: 'Project team employee was successfully created.' }
        format.json { render :show, status: :created, location: @project_team_employee }
      else
        format.html { render :new }
        format.json { render json: @project_team_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_team_employees/1
  # PATCH/PUT /project_team_employees/1.json
  def update
    respond_to do |format|
      if @project_team_employee.update(project_team_employee_params)
        format.html { redirect_to @project_team_employee, notice: 'Project team employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_team_employee }
      else
        format.html { render :edit }
        format.json { render json: @project_team_employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_team_employees/1
  # DELETE /project_team_employees/1.json
  def destroy
    @project_team_employee.destroy
    respond_to do |format|
      format.html { redirect_to project_team_employees_url, notice: 'Project team employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_team_employee
      @project_team_employee = ProjectTeamEmployee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_team_employee_params
      params.require(:project_team_employee).permit(:employee, :project, :project_team_role)
    end
end
