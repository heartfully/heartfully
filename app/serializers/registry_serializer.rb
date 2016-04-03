class RegistrySerializer < ActiveModel::Serializer
  attributes :id, :name, :campaign_message, :couple_id

  has_many :projects
  embed :ids, :include => true
end
