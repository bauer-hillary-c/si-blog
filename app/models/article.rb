class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2}
  validates :text, presence: true, length: {minimum: 2}

  belongs_to :user
  has_many :likes
  has_many :likers, source: :user, through: :likes
end
