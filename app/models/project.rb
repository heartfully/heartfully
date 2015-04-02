class Project < ActiveRecord::Base
  include Filterable #allows for easy model filtering

  scope :in_category, -> (category_id = nil) { joins(:project_categories).where("project_categories.category_id" => category_id).group("projects.id").having('count(*) = ?', (category_id.is_a?(Array) ? category_id.length : 1)) }

  belongs_to :organization
  has_many :registry_projects
  has_many :registries, :through => :registry_projects
  has_many :item_types, :dependent => :destroy
  has_many :items, :through => :item_types
  has_many :purchases, :through => :items
  has_many :project_categories
  has_many :categories, :through => :project_categories

  validates_presence_of :name, :country, :public?, :organization_id
  validates_associated :organization

  def total_cost(items = '')
    total = 0
    item_types.each do |item_type|
      if items.empty?
        total += (item_type.price * item_type.items.count).to_i
      else
        total += (item_type.price * item_type.items.purchased.count).to_i
      end
    end
    total
  end
end

# == Schema Information
#
# Table name: projects
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  headline        :string(255)
#  description     :text
#  project_url     :string(255)
#  profile_img     :string(255)
#  banner_img      :string(255)
#  city            :string(255)
#  state           :string(255)
#  country         :string(255)      not null
#  funding_goal    :decimal(11, 2)
#  closed_at       :datetime
#  public          :boolean          default(TRUE), not null
#  organization_id :integer          not null
#  created_at      :datetime
#  updated_at      :datetime
#
