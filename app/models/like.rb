class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter

  def update_likes_counter
    post.update(likes_count: post.likes.count)
  end
end
