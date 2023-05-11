class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  has_many :private_messages_sent, class_name: 'PrivateMessage', foreign_key: 'sender_id'
  has_many :private_messages_received, class_name: 'PrivateMessage', foreign_key: 'recipient_id'
  has_many :comments
  has_many :likes
  validates :password, presence: true, length: { minimum:6 }, confirmation: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Format d'email invalide." }
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 13 }
end