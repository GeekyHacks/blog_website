class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :increment_post_likes_counter
  after_destroy :decrement_post_likes_counter

  private

  def decrement_post_likes_counter
    post.update(likes_counter: post.likes_counter.to_i - 1)
  end

  def increment_post_likes_counter
    post.update(likes_counter: post.likes_counter.to_i + 1)
  end
end
