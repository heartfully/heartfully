class Order < ActiveRecord::Base
  belongs_to :registry
  has_many :items

  include ActionView::Helpers::NumberHelper
  include OrderProcess

  scope :complete, -> { where(status: 'complete') }

  def complete
    self.update(status: 'complete')
  end

  def item
    (eval summary).keys.join(', ')
  end

  def quantity
    (eval summary).values.join(', ')
  end

  def total_big_decimal
    total && BigDecimal(total.gsub(/[^\d.]/, ''))
  end
end

# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  email       :string(255)
#  registry_id :integer
#  status      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  total       :string(255)
#  first_name  :string(255)
#  last_name   :string(255)
#  summary     :text
#  message     :text
#
