class Category < ActiveRecord::Base
  has_many :project_categories
  has_many :projects, :through => :project_categories
end

# == Schema Information
#
# Table name: categories
#
#  id       :integer          not null, primary key
#  name     :string(255)      not null
#  cat_type :string(255)      not null
#
