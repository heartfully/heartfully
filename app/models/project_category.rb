class ProjectCategory < ActiveRecord::Base
  belongs_to :project
  belongs_to :category

  validates_uniqueness_of :project_id, :scope => :category_id
end

# == Schema Information
#
# Table name: project_categories
#
#  id          :integer          not null, primary key
#  project_id  :integer          not null
#  category_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#
