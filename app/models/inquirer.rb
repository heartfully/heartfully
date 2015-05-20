class Inquirer < ActiveRecord::Base
  validates_presence_of :name, :email

  def clean_contact_method(options)
    string = ''
    options.each do |method, value|
      string += "#{method} " if value.to_i == 1
    end
    self.preferred_contact_method = string
  end
end
