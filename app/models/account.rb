class Account < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable, :validatable
  has_many :articles
end
