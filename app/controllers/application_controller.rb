class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # require 'will_paginate/array'
	# WillPaginate.per_page = 10
	
	def prepare_filter_data_for_query(obj_class, filter_form_params, filter_keys)
		
		filter_string = ""
		
		filter_keys.each do |filter_key|
			if filter_form_params.include?(filter_key.to_sym)
				filter_string_leader = filter_string.length > 0 ? " AND " : ""
				case obj_class.columns_hash[filter_key].type
				when :string, :text
					if filter_form_params[filter_key.to_sym].length == 0
						filter_form_params.except!(filter_key.to_sym)
					else
						filter_form_params[filter_key.to_sym] = "%" + filter_form_params[filter_key.to_sym] + "%"
						filter_string += filter_string_leader + "#{filter_key} LIKE :#{filter_key}"
						end
				when :boolean
					if ["1", "0"].include?(filter_form_params[filter_key.to_sym]) == false
						filter_form_params.except!(filter_key.to_sym)
					else
						filter_string += filter_string_leader + "#{filter_key} = :#{filter_key}"
					end
				end
			end
		end
		
		return { filter_string: filter_string, filter_form_params: filter_form_params, filter_keys: filter_keys }
		
	end
  
	def create_record(obj_name)
		if params[obj_name.downcase.to_sym].has_key?(:is_deleted) && params[obj_name.downcase.to_sym].has_key?(:deleted_at) && params[obj_name.downcase.to_sym][:is_deleted] == "1"
			params[obj_name.downcase.to_sym][:deleted_at] = DateTime.current
		end
		
		instance_variable_set("@" + obj_name.downcase, obj_name.titlecase.constantize.new(send(obj_name.downcase + "_params")))

		respond_to do |format|
			if instance_variable_get("@" + obj_name.downcase).save
				if params.has_key?(:btn_create_add_another)
					format.html { redirect_to send("new_" + obj_name.downcase + "_path"), notice: obj_name.titlecase + ' was successfully created.' }
					format.json { render index, status: :created, location: send("new_" + obj_name.downcase + "_path") }
				else
					format.html { redirect_to send(obj_name.downcase + "s_path"), notice: obj_name.titlecase + ' was successfully created.' }
					format.json { render index, status: :created, location: send(obj_name.downcase + "s_path") }
				end
			else
				format.html { render :new }
				format.json { render json: instance_variable_get("@" + obj_name.downcase).errors, status: :unprocessable_entity }
			end
		end
	end
	
	def update_record(obj_name)
		respond_to do |format|
			
			if params[obj_name.downcase.to_sym].has_key?(:is_deleted) && params[obj_name.downcase.to_sym].has_key?(:deleted_at)
				if params[obj_name.downcase.to_sym][:is_deleted] == "1" && instance_variable_get("@" + obj_name.downcase).is_deleted == false
					params[obj_name.downcase.to_sym][:deleted_at] = DateTime.current
				elsif params[obj_name.downcase.to_sym][:is_deleted] == "0" && instance_variable_get("@" + obj_name.downcase).is_deleted == true
					params[obj_name.downcase.to_sym][:deleted_at] = nil
				end
			end
			
			if instance_variable_get("@" + obj_name.downcase).update(send(obj_name.downcase + "_params"))
				format.html { redirect_to send(obj_name.downcase + "s_path"), notice: obj_name.titlecase + ' was successfully updated.' }
				format.json { render :index, status: :ok, location: send(obj_name.downcase + "s_path") }
			else
				format.html { render :edit }
				format.json { render json: instance_variable_get("@" + obj_name.downcase).errors, status: :unprocessable_entity }
			end
		end
	end
		
  def activate_record(obj_name)
		instance_variable_set("@" + obj_name.downcase, obj_name.titlecase.constantize.find(params[:id]))
		respond_to do |format|
			if instance_variable_get("@" + obj_name.downcase).update(:is_active => "1")
				format.html { redirect_to send(obj_name.downcase + "s_path"), notice: obj_name.titlecase + ' was successfully activated.' }
				format.json { render :index, status: :ok, location: send(obj_name.downcase + "s_path") }
			else
				format.html { render :index }
				format.json { render json: instance_variable_get("@" + obj_name.downcase).errors, status: :unprocessable_entity }
			end
		end
  end
  
	def deactivate_record(obj_name)
		instance_variable_set("@" + obj_name.downcase, obj_name.titlecase.constantize.find(params[:id]))
		respond_to do |format|
			if instance_variable_get("@" + obj_name.downcase).update(:is_active => "0")
				format.html { redirect_to send(obj_name.downcase + "s_path"), notice: obj_name.titlecase + ' was successfully deactivated.' }
				format.json { render :index, status: :ok, location: send(obj_name.downcase + "s_path") }
			else
				format.html { render :index }
				format.json { render json: instance_variable_get("@" + obj_name.downcase).errors, status: :unprocessable_entity }
			end
		end
		
	end
	
	def do_delete_record(obj_name)
		instance_variable_set("@" + obj_name.downcase, obj_name.titlecase.constantize.find(params[:id]))
		respond_to do |format|
			if instance_variable_get("@" + obj_name.downcase).update(:is_deleted => "1", :deleted_at => DateTime.current)
				format.html { redirect_to send(obj_name.downcase + "s_path"), notice: obj_name.titlecase + ' was successfully deleted.' }
				format.json { render :index, status: :ok, location: send(obj_name.downcase + "s_path") }
			else
				format.html { render :index }
				format.json { render json: instance_variable_get("@" + obj_name.downcase).errors, status: :unprocessable_entity }
			end
		end
	end
	
	def undo_delete_record(obj_name)
		instance_variable_set("@" + obj_name.downcase, obj_name.titlecase.constantize.find(params[:id]))
		respond_to do |format|
			if instance_variable_get("@" + obj_name.downcase).update(:is_deleted => "0", :deleted_at => nil)
				format.html { redirect_to send(obj_name.downcase + "s_path"), notice: obj_name.titlecase + ' was successfully undeleted.' }
				format.json { render :index, status: :ok, location: send(obj_name.downcase + "s_path") }
			else
				format.html { render :index }
				format.json { render json: instance_variable_get("@" + obj_name.downcase).errors, status: :unprocessable_entity }
			end
		end
	end
	
  def destroy_record(obj_name)
    instance_variable_get("@" + obj_name.downcase).destroy
    respond_to do |format|
      format.html { redirect_to send(obj_name.downcase + "s_url"), notice: obj_name.titlecase + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
end
