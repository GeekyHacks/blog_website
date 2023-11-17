class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # validations
  validates :name, presence: true, format: { without: /\d/, message: 'should not contain numbers' },
                   length: { minimum: 3, maximum: 50 }, uniqueness: true
  validates :photo, presence: true, uniqueness: true
  validates :bio, presence: true, length: { minimum: 20, maximum: 145 }
  validates :postcounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
