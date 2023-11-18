require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @author = User.create(name: 'Abdu', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.')
    @user = User.create(name: 'Nasser', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Yemen.')
    @post = Post.create(author: @author, title: 'Harru', text: 'Hello Abdu....', comments_counter: 8,
                        likes_counter: 0)
  end

  context '#create' do
    it 'is not valid without post' do
      expect(Comment.new(user: @user)).to_not be_valid
    end

    it 'is not valid without user' do
      expect(Comment.new(post: @post)).to_not be_valid
    end
  end

  context '#update_comments_counter' do
    before :all do
      8.times { |comment_i| Comment.create(user: @user, post: @post, text: (comment_i + 1).to_s) }
    end

    it 'keeps track of comments and equals 8' do
      expect(@post.comments_counter).to eq 8
    end
  end
end
