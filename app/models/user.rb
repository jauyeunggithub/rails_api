class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Using Devise for authentication
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
