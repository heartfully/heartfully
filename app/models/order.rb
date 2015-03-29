class Order < ActiveRecord::Base
  belongs_to :registry
  has_many :items

  include ActionView::Helpers::NumberHelper
  include OrderProcess

  def complete
    self.update(status: 'complete')
  end
end
