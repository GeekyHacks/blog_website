class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: true

  # validations
  validates :text, presence: true, length: { minimum: 20, maximum: 250 }

  after_create :increment_post_comments_counter
  after_destroy :decrement_post_comments_counter

  private

  def decrement_post_comments_counter
    post.decrement!(:comments_counter)
  end

  def increment_post_comments_counter
    post.increment!(:comments_counter)
  end
end
