# == Schema Information
#
# Table name: reports
#
#  id                              :integer          not null, primary key
#  number_of_benefitters           :integer
#  number_of_communities_served    :integer
#  number_of_trainings_complete    :integer
#  number_of_buildings_constructed :string(255)
#  other_benefits                  :string(255)
#  impact_measurement              :text
#  forward_steps                   :text
#  thank_you_message               :text
#  photo1_file_name                :string(255)
#  photo1_content_type             :string(255)
#  photo1_file_size                :integer
#  photo1_updated_at               :datetime
#  photo2_file_name                :string(255)
#  photo2_content_type             :string(255)
#  photo2_file_size                :integer
#  photo2_updated_at               :datetime
#  photo3_file_name                :string(255)
#  photo3_content_type             :string(255)
#  photo3_file_size                :integer
#  photo3_updated_at               :datetime
#  photo4_file_name                :string(255)
#  photo4_content_type             :string(255)
#  photo4_file_size                :integer
#  photo4_updated_at               :datetime
#  photo5_file_name                :string(255)
#  photo5_content_type             :string(255)
#  photo5_file_size                :integer
#  photo5_updated_at               :datetime
#  organization_id                 :integer
#  created_at                      :datetime
#  updated_at                      :datetime
#

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
