class CoupleSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_img, :address_1, :address_2, :city, :state, :postal_code, :country

  has_many :partners
end
