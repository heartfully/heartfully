class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :message, :purchased_at

  has_many :items
end
