class EmployersController < ApplicationController
	before_action :set_employer, only: [:edit, :update, :activate, :deactivate, :do_delete, :undo_delete]  #:show, :destroy
	# GET /employers
	# GET /employers.json
	def index
		
		# search_params = Hash.new
		# search_params["employer"] = Hash.new
		# params.each do |param|
			# if param.length > 1
				# search_params["employer"][param] = params[param]
			# end
		# end
		# Rails.logger.debug "**** search_params.inspect:#{search_params.inspect}"
		# Rails.logger.debug "**** params.inspect ****:#{params.inspect}"
		
		# Rails.logger.debug "**** params.inspect ****:#{params.inspect}"
		# Rails.logger.debug "**** employer_params.inspect ****:#{employer_params.inspect}"
		
		if params.has_key?(:btn_employers_apply_filters)
			employer_filter_params = employer_params
			# Rails.logger.debug "**** employer_filter_params ****:#{employer_filter_params}"
			if employer_filter_params[:name].strip.length == 0
				employer_filter_params.except!(:name)
			end
			if ["1", "0"].include?(employer_filter_params[:is_active]) == false
				employer_filter_params.except!(:is_active)
			end
			if ["1", "0"].include?(employer_filter_params[:is_deleted]) == false
				employer_filter_params.except!(:is_deleted)
			end
			# Rails.logger.debug "**** employer_filter_params ****:#{employer_filter_params}"
			# Rails.logger.debug "**** TEST 1 ****"
			if employer_filter_params.has_key?(:name) || employer_filter_params.has_key?(:is_active) || employer_filter_params.has_key?(:is_deleted)
				@employers = Employer.where(employer_filter_params)
			else
				@employers = Employer.all
			end
		else
			Rails.logger.debug "**** TEST 2 ****"
			@employers = Employer.all
		end
		
		# @employers = Employer.filter(params.slice(:name, :is_active, :is_deleted))
		
	end

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
				if params.has_key?(:btn_create_add_another)
					format.html { redirect_to new_employer_path, notice: 'Employer was successfully created.' }
					format.json { render index, status: :created, location: new_employer_path }
				else
					format.html { redirect_to employers_path, notice: 'Employer was successfully created.' }
					format.json { render index, status: :created, location: employers_path }
				end
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
	
	def activate
		@employer = Employer.find(params[:id])
		respond_to do |format|
			if @employer.update(:is_active => "1")
				format.html { redirect_to employers_path, notice: 'Employer was successfully activated.' }
				format.json { render :index, status: :ok, location: employers_path }
			else
				format.html { render :index }
				format.json { render json: @employer.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def deactivate
		@employer = Employer.find(params[:id])
		respond_to do |format|
			if @employer.update(:is_active => "0")
				format.html { redirect_to employers_path, notice: 'Employer was successfully deactivated.' }
				format.json { render :index, status: :ok, location: employers_path }
			else
				format.html { render :index }
				format.json { render json: @employer.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def do_delete
		@employer = Employer.find(params[:id])
		respond_to do |format|
			if @employer.update(:is_deleted => "1", :deleted_at => DateTime.current)
				format.html { redirect_to employers_path, notice: 'Employer was successfully deleted.' }
				format.json { render :index, status: :ok, location: employers_path }
			else
				format.html { render :index }
				format.json { render json: @employer.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def undo_delete
		@employer = Employer.find(params[:id])
		respond_to do |format|
			if @employer.update(:is_deleted => "0", :deleted_at => nil)
				format.html { redirect_to employers_path, notice: 'Employer was successfully undeleted.' }
				format.json { render :index, status: :ok, location: employers_path }
			else
				format.html { render :index }
				format.json { render json: @employer.errors, status: :unprocessable_entity }
			end
		end
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
	
	# # A list of the param names that can be used for filtering the list
	# def filtering_params(params)
		# params.slice(:name, :is_active, :is_deleted)
	# end
	
end
