class User < ActiveRecord::Base
  before_create :generate_token	

	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, presence: true, length: { maximum: 64 }
  validates :last_name, presence: true, length: { maximum: 64 }
  validates :email, presence: true, length: { minimum: 4, maximum:64 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, :length => { in: 6..24 }, :allow_nil => true
  
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :photos 

  has_many :friendships, foreign_key: "friender_id", dependent: :destroy
  has_many :friended_users, through: :friendships, source: :friended
  has_many :reverse_friendships, foreign_key: "friended_id", 
                                 class_name: "Friendship", dependent: :destroy
  has_many :frienders, through: :reverse_friendships, source: :friender

  belongs_to :profile_photo, class_name: "Photo"
  belongs_to :cover_photo, class_name: "Photo"

  def newsfeed
    Post.where("user_id =?", id)
  end  

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

  def friended?(other_user)
    friendships.find_by_friended_id(other_user.id)
  end

  def friend!(other_user)
    friendships.create!(friended_id: other_user.id)
  end

  def unfriend!(other_user)
    friendships.find_by_friended_id(other_user.id).destroy
  end

end
