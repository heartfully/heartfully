class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :item_type_id, :purchase_id

  has_one :item_type
end
