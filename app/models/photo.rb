class Photo < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :large => "500x500", :thumb => "262x262" }
  
  has_one :profile_photo_user, foreign_key: :profile_photo_id, :class_name => "User"
  has_one :cover_photo_user, foreign_key: :cover_photo_id, :class_name => "User"

  validates_presence_of :image_file_name, :image_content_type, :image_file_size, :image_updated_at
	validates_attachment_content_type :image, :content_type => /\@image\/.*\Z/
	validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 2.megabytes
end