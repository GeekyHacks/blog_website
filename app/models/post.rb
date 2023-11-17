class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  # validations
  validates :title, presence: true, format: { without: /\d/, message: 'should not contain numbers' },
                    length: { minimum: 3, maximum: 50 }, uniqueness: true
  validates :text, presence: true, length: { minimum: 20, maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.update(posts_count: user.posts.count)
  end
end
