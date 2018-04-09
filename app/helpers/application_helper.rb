module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Sample Wanting"
		if page_title.empty?
			base_title
		else
			page_title + ' | ' + base_title
		end
	end

	def time_now time
		time.strftime("%d %b in %Y")
	end

	def img_chose tip
		if tip.user.try(:admin)
			'pic.jpg'
		else
			'user.jpg'
		end
	end
end
