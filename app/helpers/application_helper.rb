module ApplicationHelper
	def link_to_bootstrap_glyphicon(path, size, type, title, glyphicons, options = {}, link_html_options = {})
		# Available options:  text_start, text_end.
		link_to path, class: "btn btn-#{size} btn-#{type}", title: title, "aria-label" => title, html_options: link_html_options do
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
	
end
