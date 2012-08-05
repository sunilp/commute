module ApplicationHelper

	#Return a title on per page
	def title
		base_title = "Commute"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end	
end
