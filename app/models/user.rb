class User < ApplicationRecord
  # Using Devise for authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
