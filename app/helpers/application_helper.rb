module ApplicationHelper

	def profile_photo(user, size)
		if user && user.profile_photo_id 
			image_tag user.profile_photo.image.url(size)
		else
			image_tag "user_silhouette_#{size.to_s}.png"
		end
	end

	def cover_photo(user)
		if user && user.cover_photo_id
			image_tag user.cover_photo.image.url, class: "cover-photo"
		else
			image_tag "hogwarts_small.jpg", class: "cover-photo"
		end
	end
  
end
