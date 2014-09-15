class RegistrySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :couple_id

  has_many :projects
  embed :ids, :include => true
end
