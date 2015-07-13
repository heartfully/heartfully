class Report < ActiveRecord::Base
  belongs_to :organization
  has_attached_file :photo1
  validates_attachment :photo1, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :photo2
  validates_attachment :photo2, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :photo3
  validates_attachment :photo3, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :photo4
  validates_attachment :photo4, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  has_attached_file :photo5
  validates_attachment :photo5, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
