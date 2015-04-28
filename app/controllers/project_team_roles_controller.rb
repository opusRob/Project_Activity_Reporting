class ProjectTeamRolesController < ApplicationController
  before_action :set_project_team_role, only: [:show, :edit, :update, :destroy]

  # GET /project_team_roles
  # GET /project_team_roles.json
  def index
    @project_team_roles = ProjectTeamRole.all
  end

  # GET /project_team_roles/1
  # GET /project_team_roles/1.json
  def show
  end

  # GET /project_team_roles/new
  def new
    @project_team_role = ProjectTeamRole.new
  end

  # GET /project_team_roles/1/edit
  def edit
  end

  # POST /project_team_roles
  # POST /project_team_roles.json
  def create
    @project_team_role = ProjectTeamRole.new(project_team_role_params)

    respond_to do |format|
      if @project_team_role.save
        format.html { redirect_to @project_team_role, notice: 'Project team role was successfully created.' }
        format.json { render :show, status: :created, location: @project_team_role }
      else
        format.html { render :new }
        format.json { render json: @project_team_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_team_roles/1
  # PATCH/PUT /project_team_roles/1.json
  def update
    respond_to do |format|
      if @project_team_role.update(project_team_role_params)
        format.html { redirect_to @project_team_role, notice: 'Project team role was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_team_role }
      else
        format.html { render :edit }
        format.json { render json: @project_team_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_team_roles/1
  # DELETE /project_team_roles/1.json
  def destroy
    @project_team_role.destroy
    respond_to do |format|
      format.html { redirect_to project_team_roles_url, notice: 'Project team role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_team_role
      @project_team_role = ProjectTeamRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_team_role_params
      params.require(:project_team_role).permit(:name, :description, :project_team, :is_active, :is_deleted, :deleted_at)
    end
end
