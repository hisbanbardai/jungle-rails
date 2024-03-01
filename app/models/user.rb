class User < ApplicationRecord
#This is the line of code that gives our User model authentication methods via bcrypt.  
  has_secure_password

  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, length: { minimum: 5 }
end
