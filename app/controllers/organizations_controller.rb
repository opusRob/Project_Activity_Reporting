class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index  	
  	page = params.has_key?(:page) ? params[:page] : 1
    
		if params.has_key?(:btn_organizations_apply_filters)
			Rails.logger.debug "*** organization_params ***:" + organization_params.inspect
			filter_data = prepare_filter_data_for_query(Organization, organization_params, ["name", "is_active", "is_deleted", "created_at_GTE", "created_at_LTE"])
			
			Rails.logger.debug "*** filter_data ***:" + filter_data.inspect
			Rails.logger.debug "*** (filter_data[:where_params].keys & (filter_data[:filter_keys].map &:to_sym)).any? ***:" + (filter_data[:where_params].keys & (filter_data[:filter_keys].map &:to_sym)).any?.inspect
			Rails.logger.debug "*** filter_data[:where_params].keys ***:" + filter_data[:where_params].keys.inspect
			Rails.logger.debug "*** (filter_data[:filter_keys].map &:to_sym)***:" + (filter_data[:filter_keys].map &:to_sym).inspect
			
			if (filter_data[:where_params].keys & (filter_data[:filter_keys].map &:to_sym)).any?
				@organizations = Organization.where(filter_data[:filter_string], filter_data[:where_params]).order(name: :asc, created_at: :desc).page(page)
			else
				@organizations = Organization.all.order(name: :asc, created_at: :desc).page(page)
			end
		else
			@organizations = Organization.where({is_active: true, is_deleted: false}).order(name: :asc, created_at: :desc).page(page)
		end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
  	create_record("organization")
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
		update_record("organization")
  end
  
  def activate
  	activate_record("organization")
  end
  
  def deactivate
  	deactivate_record("organization")
  end
	
	def do_delete
  	do_delete_record("organization")
	end
	
	def undo_delete
  	undo_delete_record("organization")
	end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    destroy_record("organization")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit( \
      	:name \
      	, :is_active \
      	, :is_deleted \
      	, :created_at_GTE \
      	, :created_at_LTE \
      	, :updated_at \
      	, :updated_at_GTE \
      	, :updated_at_LTE \
      	, :deleted_at \
      	, :deleted_at_GTE \
      	, :deleted_at_LTE \
      )
    end
end
