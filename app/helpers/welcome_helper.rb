module WelcomeHelper

	def open_row count
		if count %4 == 0
			"<div class= 'row'>".html_safe
		end
	end
	
	def close_row count
		if count%4 == 0 
          "</div>".html_safe 
        end		
	end

end
