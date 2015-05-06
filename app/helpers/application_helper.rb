module ApplicationHelper
	
	def is_datetime(datetime_string)
		begin
			parse_datetime(datetime_string)
			return true
		rescue
			return false
		end
	end
	
	def parse_datetime(datetime_string)
		# Replace date/time delimiters such as slashes, dashes, colons and spaces with dashes:
		datetime_string.gsub!(/[\/\-: ]/, "-")
		
		# Lowercase the string and strip out any remaining characters that aren't numbers, dashes, or "a", "m" or "p":
		datetime_string.downcase!
		datetime_string.gsub!(/[^0-9\-amp]/, "")
		
		# Remove any instances of double dashes:
		while datetime_string.include?("--") do
			datetime_string.gsub!(/--/, "-")
		end		
				
		# Break the string into an array using dashes as the splitter:
		datetime_array = datetime_string.split("-")
		
		# If the first item is empty, get rid of it:
		if !datetime_array[0].length
			datetime_array.shift
		end
		
		# If the last array element includes "a", "m" or "p":
		if (datetime_array[datetime_array.length - 1].split("") & ["a", "m", "p"]).any?
			# If the last array has at least 5 elements (year, month, day, hour [, minutes] [, seconds] and "am/pm"):
			if datetime_array.length > 4
				# If the hours element is between 1 and 11, AND the last array element is "p" or "pm":
				if (1..11).include?(datetime_array[3].to_i) && ["p", "pm"].include?(datetime_array[datetime_array.length - 1])
					# Increase the hours element value by 12 (ex. 3 PM should be 15, etc.):
					datetime_array[3] = datetime_array[3].to_i + 12
				# Else if the hours element is 12, AND the last array element is "a" or "am":
				elsif datetime_array[3].to_i == 12 && ["a", "am"].include?(datetime_array[datetime_array.length - 1])
					# Set the hours element value to 0 (12 AM = 00):
					datetime_array[3] = 0
				end
			end
			# Remove the "am/pm" element since we no longer need it:
			datetime_array.pop()
		end
		
		# If the array is only two elements (month and day), OR its greater than two elements AND the length of the second element is 0:
		if datetime_array.length == 2 || (datetime_array.length > 2 && datetime_array[2].length == 0)
			# Set the third element to this year:
			datetime_array.push(DateTime.now.year.to_s)
		end
		
		# If the array is at least two elements:
		if datetime_array.length >= 2
			# Prepend "2", "20", or "200" to it based on it's length, thus it assumes that the shortened year value is in the 2000's:
			case datetime_array[2].length
			when 1
				datetime_array[2] = "200" + datetime_array[2]
			when 2
				datetime_array[2] = "20" + datetime_array[2]
			when 3
				datetime_array[2] = "2" + datetime_array[2]
			end
		end
		
		# Rearrange array elements: year, month, day = month, day, year:
		datetime_array[0], datetime_array[1], datetime_array[2] = datetime_array[2], datetime_array[0], datetime_array[1]

		# Attempt to return a datetime using the array elements:
		return DateTime.new( \
			datetime_array[0].to_i \
			, datetime_array[1].to_i \
			, datetime_array[2].to_i \
			, datetime_array.length > 3 && (0..23).include?(datetime_array[3].to_i) ? datetime_array[3].to_i : 0 \
			, datetime_array.length > 4 && (0..59).include?(datetime_array[4].to_i) ? datetime_array[4].to_i : 0 \
			, datetime_array.length > 5 && (0..59).include?(datetime_array[5].to_i) ? datetime_array[5].to_i : 0 \
		)
		
		# helper.parse_datetime("5/13/2015")
		# helper.parse_datetime("5/13/2015 PM")
		# helper.parse_datetime("5/13/2015 12 PM")
		# helper.parse_datetime("5/13/2015 1 PM")
		# helper.parse_datetime("5/13/2015 12 AM")
		# helper.parse_datetime("5/13/2015 1 AM")		
		# return datetime_array
		
	end
	
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











