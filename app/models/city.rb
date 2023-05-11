class City < ApplicationRecord
  has_many :users
  has_many :gossips, through: :users
  has_many :tags, through: :gossips
  
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :zip_code, presence: true, length: { is: 5 }, format: { with: /\A\d{5}\z/, message: 'Le code postal doit avoir un format 12345' }
end