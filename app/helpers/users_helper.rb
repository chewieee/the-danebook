module UsersHelper
	def birthday(user)
		"#{user.birth_day}-#{user.birth_month}-#{user.birth_year}"
	end
end
