class SystemRolesController < ApplicationController
  before_action :set_system_role, only: [:show, :edit, :update, :destroy]

  # GET /system_roles
  # GET /system_roles.json
  def index
    @system_roles = SystemRole.all
  end

  # GET /system_roles/1
  # GET /system_roles/1.json
  def show
  end

  # GET /system_roles/new
  def new
    @system_role = SystemRole.new
  end

  # GET /system_roles/1/edit
  def edit
  end

  # POST /system_roles
  # POST /system_roles.json
  def create
    @system_role = SystemRole.new(system_role_params)

    respond_to do |format|
      if @system_role.save
        format.html { redirect_to @system_role, notice: 'System role was successfully created.' }
        format.json { render :show, status: :created, location: @system_role }
      else
        format.html { render :new }
        format.json { render json: @system_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_roles/1
  # PATCH/PUT /system_roles/1.json
  def update
    respond_to do |format|
      if @system_role.update(system_role_params)
        format.html { redirect_to @system_role, notice: 'System role was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_role }
      else
        format.html { render :edit }
        format.json { render json: @system_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_roles/1
  # DELETE /system_roles/1.json
  def destroy
    @system_role.destroy
    respond_to do |format|
      format.html { redirect_to system_roles_url, notice: 'System role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_role
      @system_role = SystemRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_role_params
      params.require(:system_role).permit(:name, :description, :is_editable, :is_active, :is_deleted, :deleted_at)
    end
end
