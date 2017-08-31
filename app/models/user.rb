# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  email           :string
#  password_digest :string
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX  }, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }
  after_initialize :set_role
  has_many :placements
  
  def set_role
    self.admin ||= false
  end
end
