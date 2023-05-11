class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  validates :title, presence: true #, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true
end
