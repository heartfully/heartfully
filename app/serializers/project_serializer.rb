class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :headline, :description, :banner_img, :city, :state, :country, :funding_goal, :closed_at, :public?, :organization_id
  has_many :categories
  embed :id, :include => true
end
