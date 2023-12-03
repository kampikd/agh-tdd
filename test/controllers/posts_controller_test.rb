require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = User.create!(email: 'test1@test.com', password: 'testest', password_confirmation: 'testest')
    @post = Post.new(title: 'title', content: 'content', user: @user)
    sign_in @user
  end

  test "should create post v1" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { content: @post.content, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should create post v2" do
    assert Post.count == 0

    post posts_url, params: { post: { content: @post.content, title: @post.title } }

    assert Post.count == 1
    assert Post.last.title == @post.title
    assert Post.last.content == @post.content

    assert_redirected_to post_url(Post.last)
  end
end
