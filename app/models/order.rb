class Order < ActiveRecord::Base
  belongs_to :registry
  has_many :items

  attr_accessor :email_subscription
  before_save :subscribe_user

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

  private

  def subscribe_user
    if email_subscription
      # TODO: put this in a background job
      gibbon = Gibbon::Request.new
      begin
        gibbon.lists("2f411af5a1").members.create(body: {email_address: email, status: "subscribed", merge_fields: {FNAME: first_name, LNAME: last_name}})
      rescue
        # Don't want a bad request to foil the purchase
      end
    end
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
