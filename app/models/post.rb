class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :likes, :as => :likable, dependent: :destroy
  
  validates :user_id, presence: true
  validates :content, presence: true

  scope :chronological, lambda { order("created_at DESC") }
  # default_scope -> { order('created_at DESC') } - "stabby lambda" syntax

  def self.from_friended_users_of(user)
    friended_user_ids = user.friended_user_ids
    where("user_id IN (?) OR user_id = ?", friended_user_ids, user).order("created_at DESC")
  end

end
