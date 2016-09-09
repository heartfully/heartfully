class ProjectSerializer < ActiveModel::Serializer
  cached
  attributes :id,
             :name,
             :partner,
             :description,
             :url_slug,
             :banner_img,
             :city,
             :country,
             :funding_goal,
             :closed_at,
             :public,
             :organization_id,
             :project_photo,
             :project_photo_2,
             :project_photo_3,
             :extra_content,
             :photo1_url

  has_many :categories
  embed :id, :include => true
end
