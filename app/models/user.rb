class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  # validaions
  validates :name, presence: true, length: { minimum: 3 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
