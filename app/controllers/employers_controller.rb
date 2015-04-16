class EmployersController < ApplicationController
	before_action :set_employer, only: [:edit, :update, :activate, :deactivate, :delete, :undelete]  #:show, :destroy
	# GET /employers
	# GET /employers.json
	def index
		@employers = Employer.all
	end

	# GET /employers/1
	# GET /employers/1.json
	# def show
	# end

	# GET /employers/new
	def new
		@employer = Employer.new
	end

	# GET /employers/1/edit
	def edit
	end

	# POST /employers
	# POST /employers.json
	def create
		if params[:employer][:is_deleted] == "1"
			params[:employer][:deleted_at] = DateTime.current
		end
		
		@employer = Employer.new(employer_params)

		respond_to do |format|
			if @employer.save
				format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
				format.json { render index, status: :created, location: employers_path }
			else
				format.html { render :new }
				format.json { render json: @employer.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /employers/1
	# PATCH/PUT /employers/1.json
	def update
		# @employer_record = Employer.find(p
		respond_to do |format|

			if params[:employer][:is_deleted] == "1" && @employer.is_deleted == false
				params[:employer][:deleted_at] = DateTime.current
			elsif params[:employer][:is_deleted] == "0" && @employer.is_deleted == true
				params[:employer][:deleted_at] = nil
			end

			if @employer.update(employer_params)
				format.html { redirect_to employers_path, notice: 'Employer was successfully updated.' }
				format.json { render :index, status: :ok, location: employers_path }
			else
				format.html { render :edit }
				format.json { render json: @employer.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /employers/1
	# DELETE /employers/1.json
 	def destroy
		@employer = Employer.find(params[:id])
		@employer.destroy
		respond_to do |format|
			format.html { redirect_to employers_url, notice: 'Employer was successfully destroyed.' }
			format.json { head :no_content }
		end
	end
	
	def activate
		Rails.logger.debug "params:#{params.inspect}"
		@employer = Employer.find(params[:id])
		params = Hash.new
		params[:employer] = Hash.new
		# params[:employer][:id] = @employer.id
		# params[:employer][:name] = @employer.name
		params[:employer][:is_active] = "1"
		# params[:employer][:is_deleted] = @employer.is_deleted
		# params[:employer][:deleted_at] = @employer.deleted_at
		# params = @employer.clone
		# params.deep_symbolize_keys
		# params[:employer][:utf8] = "&#x2713;"
		# params[:employer][:_method] = "patch"
		
		# params[:employer][:is_active] = "1"
		update
		# redirect_to :controller => "employer", :action => "update", :id => params[:employer][:id], :is_active => "1"
	end

	private

	# Use callbacks to share common setup or constraints between actions.
	def set_employer
		@employer = Employer.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def employer_params
		params.require(:employer).permit(:name, :is_active, :is_deleted, :deleted_at)
	end
end
