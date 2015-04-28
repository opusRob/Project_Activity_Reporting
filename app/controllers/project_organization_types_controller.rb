class ProjectOrganizationTypesController < ApplicationController
  before_action :set_project_organization_type, only: [:show, :edit, :update, :destroy]

  # GET /project_organization_types
  # GET /project_organization_types.json
  def index
    @project_organization_types = ProjectOrganizationType.all
  end

  # GET /project_organization_types/1
  # GET /project_organization_types/1.json
  def show
  end

  # GET /project_organization_types/new
  def new
    @project_organization_type = ProjectOrganizationType.new
  end

  # GET /project_organization_types/1/edit
  def edit
  end

  # POST /project_organization_types
  # POST /project_organization_types.json
  def create
    @project_organization_type = ProjectOrganizationType.new(project_organization_type_params)

    respond_to do |format|
      if @project_organization_type.save
        format.html { redirect_to @project_organization_type, notice: 'Project organization type was successfully created.' }
        format.json { render :show, status: :created, location: @project_organization_type }
      else
        format.html { render :new }
        format.json { render json: @project_organization_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_organization_types/1
  # PATCH/PUT /project_organization_types/1.json
  def update
    respond_to do |format|
      if @project_organization_type.update(project_organization_type_params)
        format.html { redirect_to @project_organization_type, notice: 'Project organization type was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_organization_type }
      else
        format.html { render :edit }
        format.json { render json: @project_organization_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_organization_types/1
  # DELETE /project_organization_types/1.json
  def destroy
    @project_organization_type.destroy
    respond_to do |format|
      format.html { redirect_to project_organization_types_url, notice: 'Project organization type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_organization_type
      @project_organization_type = ProjectOrganizationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_organization_type_params
      params.require(:project_organization_type).permit(:name, :description, :is_active, :is_deleted, :deleted_at)
    end
end
