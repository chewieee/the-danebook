require 'open-uri'
class Photo < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :as => :commentable, dependent: :destroy
  has_many :likes, :as => :likable, dependent: :destroy

	has_attached_file :image, :styles => { :large => "500x500", :medium => "230x315", :thumb => "75x75", :xs => "50x50" }
  
  has_one :profile_photo_user, foreign_key: :profile_photo_id, :class_name => "User"
  has_one :cover_photo_user, foreign_key: :cover_photo_id, :class_name => "User"

  validates_presence_of :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  validates_attachment_content_type :image, :content_type => [ "image/jpeg",
                                                               "image/gif",
                                                               "image/png" ]
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 2.megabytes


  attr_accessor :url

	def image_from_url(url)
		self.image = open(url)
	end

end
