class Like < ActiveRecord::Base
	belongs_to :user
	belongs_to :likable, :polymorphic => true

	validates :user_id, presence: true
end
