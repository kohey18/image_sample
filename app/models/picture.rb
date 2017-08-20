class Picture < ActiveRecord::Base

  default_scope -> {order(position: :asc)}
  acts_as_list

  has_attached_file :image
  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :name, presence: true
  validates :image, presence: true

end
