class Project < ActiveRecord::Base
  include Filterable #allows for easy model filtering
  has_attached_file :photo1
  has_attached_file :photo2
  has_attached_file :photo3
  has_attached_file :photo4
  has_attached_file :photo5
  has_attached_file :budget
  validates_attachment_content_type :photo1, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo2, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo3, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo4, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo5, :content_type => /\Aimage\/.*\Z/
  validates_attachment :budget, content_type: { :content_type => %w(application/pdf
                                                                    application/msword
                                                                    application/xlsx
                                                                    application/xls
                                                                    application/csv
                                                                    application/vnd.openxmlformats-officedocument.wordprocessingml.document
                                                                    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
                                                                    application/vnd.ms-excel
                                                                    application/vnd.openxmlformats-officedocument.wordprocessingml.document
                                                                    application/vnd.openxmlformats-officedocument.wordprocessingml.template
                                                                    application/x-tar
                                                                    application/vnd.ms-excel
                                                                    application/vnd.openxmlformats-officedocument.spreadsheetml.template
                                                                    application/zip
                                                                    application/x-compressed-zip) }
  serialize :extra_content, Hash

  scope :in_category, -> (category_id = nil) { joins(:project_categories).where("project_categories.category_id" => category_id).group("projects.id").having('count(*) = ?', (category_id.is_a?(Array) ? category_id.length : 1)) }

  belongs_to :organization
  has_many :registry_projects
  has_many :registries, :through => :registry_projects
  has_many :item_types, :dependent => :destroy
  has_many :items, :through => :item_types
  has_many :purchases, :through => :items
  has_many :project_categories
  has_many :categories, :through => :project_categories

  validates_presence_of :name, :country, :organization_id #:public?
  validates_associated :organization
  validates_uniqueness_of :name
  validates_acceptance_of :certified

  def photo1_url
    self.photo1.url
  end
end

# == Schema Information
#
# Table name: projects
#
#  id                   :integer          not null, primary key
#  name                 :string(255)      not null
#  partner              :string(255)
#  description          :text
#  url_slug             :string(255)
#  banner_img           :string(255)
#  city                 :string(255)
#  country              :string(255)      not null
#  funding_goal         :decimal(11, 2)
#  closed_at            :datetime
#  public               :boolean          default(TRUE), not null
#  organization_id      :integer          not null
#  created_at           :datetime
#  updated_at           :datetime
#  project_photo        :string(255)
#  project_photo_2      :string(255)
#  project_photo_3      :string(255)
#  extra_content        :text
#  contact_name         :string(255)
#  contact_email        :string(255)
#  contact_phone_number :string(255)
#  sector               :string(255)
#  overview             :text
#  problem              :text
#  solution             :text
#  how_it_works_step1   :string(350)
#  how_it_works_step2   :string(350)
#  how_it_works_step3   :string(350)
#  how_it_works_step4   :string(350)
#  how_it_works_step5   :string(350)
#  importance           :text
#  sustainability       :text
#  staff_quote          :string(255)
#  photo1_file_name     :string(255)
#  photo1_content_type  :string(255)
#  photo1_file_size     :integer
#  photo1_updated_at    :datetime
#  photo2_file_name     :string(255)
#  photo2_content_type  :string(255)
#  photo2_file_size     :integer
#  photo2_updated_at    :datetime
#  photo3_file_name     :string(255)
#  photo3_content_type  :string(255)
#  photo3_file_size     :integer
#  photo3_updated_at    :datetime
#  photo4_file_name     :string(255)
#  photo4_content_type  :string(255)
#  photo4_file_size     :integer
#  photo4_updated_at    :datetime
#  photo5_file_name     :string(255)
#  photo5_content_type  :string(255)
#  photo5_file_size     :integer
#  photo5_updated_at    :datetime
#  certified            :boolean
#  budget_file_name     :string(255)
#  budget_content_type  :string(255)
#  budget_file_size     :integer
#  budget_updated_at    :datetime
#
