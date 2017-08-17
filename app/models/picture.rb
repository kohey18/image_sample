class Picture < ActiveRecord::Base

  has_attached_file :image
  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :name, presence: true
  validates :image, presence: true

end
