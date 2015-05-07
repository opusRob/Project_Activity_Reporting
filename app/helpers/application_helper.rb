module ApplicationHelper
	
	def bootstrap_glyphicon(glyphicons)
		# Available options:  text_start, text_end.
		generated_html = ""
		glyphicons.each do |glyphicon|
			generated_html += '<span class="glyphicon glyphicon-' + glyphicon + '" aria-hidden="true"></span>'
		end
		raw(generated_html)
	end
	
	def link_to_bootstrap_glyphicon(path, size, type, title, glyphicons, options = {}, link_html_options = {})
		# Available options:  text_start, text_end.
		link_to path, class: "btn btn-#{size} btn-#{type}", title: title, "aria-label" => title, method: options[:method], data: options[:data], html_options: link_html_options do
			link_inner_html = options[:text_start].to_s
			glyphicons.each do |glyphicon|
				link_inner_html += '<span class="glyphicon glyphicon-' + glyphicon + '" aria-hidden="true"></span>'
			end
			link_inner_html += options[:text_end].to_s
			
			raw(link_inner_html)
			
		end
	end
	
	def button_tag_bootstrap_glyphicon(button_type, name, size, type, title, glyphicons, options = {}, button_html_options = {})
		# Available options:  text_start, text_end.
		button_tag type: button_type, name: name, class: "btn btn-#{size} btn-#{type}", title: title, "aria-label" => title, html_options: button_html_options do
			button_inner_html = options[:text_start].to_s
			glyphicons.each do |glyphicon|
				button_inner_html += '<span class="glyphicon glyphicon-' + glyphicon + '" aria-hidden="true"></span>'
			end
			button_inner_html += options[:text_end].to_s
			
			raw(button_inner_html)
			
		end
	end
	
	def link_activate_deactivate(is_active, deactivate_path, activate_path)
		if is_active
			link_to 'Deactivate', deactivate_path, method: :deactivate, data: { confirm: 'Are you sure you want to deactivate this record?' }
		else
			link_to 'Activate', deactivate_path, method: :activate, data: { confirm: 'Are you sure you want to activate this record?' }
		end
	end
	
	def link_delete_undelete(is_deleted, undelete_path, delete_path)
		if is_deleted
			link_to 'Delete', do_delete_path, method: :do_delete, data: { confirm: 'Are you sure you want to delete this record?' }
		else
			link_to 'Undelete', undo_delete_path, method: :undo_delete, data: { confirm: 'Are you sure you want to undelete this record?' }
		end
	end
	
end











