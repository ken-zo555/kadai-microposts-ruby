class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  has_many :reverses_of_like_micropost, class_name: 'Favorite', foreign_key: 'micropost_id'
  has_many :liked_microposts, through: :reverses_of_like_micropost, source: :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
end
