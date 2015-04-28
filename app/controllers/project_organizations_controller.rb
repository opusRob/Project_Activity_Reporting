class ProjectOrganizationsController < ApplicationController
  before_action :set_project_organization, only: [:show, :edit, :update, :destroy]

  # GET /project_organizations
  # GET /project_organizations.json
  def index
    @project_organizations = ProjectOrganization.all
  end

  # GET /project_organizations/1
  # GET /project_organizations/1.json
  def show
  end

  # GET /project_organizations/new
  def new
    @project_organization = ProjectOrganization.new
  end

  # GET /project_organizations/1/edit
  def edit
  end

  # POST /project_organizations
  # POST /project_organizations.json
  def create
    @project_organization = ProjectOrganization.new(project_organization_params)

    respond_to do |format|
      if @project_organization.save
        format.html { redirect_to @project_organization, notice: 'Project organization was successfully created.' }
        format.json { render :show, status: :created, location: @project_organization }
      else
        format.html { render :new }
        format.json { render json: @project_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_organizations/1
  # PATCH/PUT /project_organizations/1.json
  def update
    respond_to do |format|
      if @project_organization.update(project_organization_params)
        format.html { redirect_to @project_organization, notice: 'Project organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_organization }
      else
        format.html { render :edit }
        format.json { render json: @project_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_organizations/1
  # DELETE /project_organizations/1.json
  def destroy
    @project_organization.destroy
    respond_to do |format|
      format.html { redirect_to project_organizations_url, notice: 'Project organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_organization
      @project_organization = ProjectOrganization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_organization_params
      params.require(:project_organization).permit(:project_id, :project_type, :organization_id, :organization_type, :project_organization_)
    end
end
