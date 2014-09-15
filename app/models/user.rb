class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :couple
  has_one :registry, :through => :couple
  has_and_belongs_to_many :guest_registries, :class_name => "Registry", :join_table => "guests_registries", :foreign_key => "guest_id"
  belongs_to :organization

  validates_presence_of :first_name
  validates_associated :couple
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  first_name             :string(255)      not null
#  last_name              :string(255)
#  profile_img            :string(255)
#  couple_id              :integer
#  organization_id        :integer
#  system_admin?          :boolean          default(FALSE), not null
#  created_at             :datetime
#  updated_at             :datetime
#
