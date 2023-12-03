require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should be saved" do
    user = User.create!(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    post = Post.new(title: 'title', content: 'content', user: user)
    assert post.save
  end

  test "should always have title" do
    user = User.create!(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    post = Post.new(content: 'content', user: user)
    assert_not post.save
  end

  test "can have empty content" do
    user = User.create!(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    post = Post.new(title: 'title', user: user)
    assert post.save
  end

  test "should always belong to user" do
    post = Post.new(title: 'title', content: 'content')
    assert_not post.save
  end

  teardown do
    User.destroy_all
  end
end
