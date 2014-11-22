class Friendship < ActiveRecord::Base
	belongs_to :friender, class_name: "User"
	belongs_to :friended, class_name: "User"

	validates :follower_id, presence: true
	validates :followed_id, presence: true
end
