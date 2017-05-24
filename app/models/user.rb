class User < ApplicationRecord
  # encrypt password
  has_secure_password
  has_many :pills, dependent: :destroy
  # Validations
  validates_presence_of :name, :email, :password_digest
end
