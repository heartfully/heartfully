class Order < ActiveRecord::Base
  belongs_to :registry
  has_many :items  
end
