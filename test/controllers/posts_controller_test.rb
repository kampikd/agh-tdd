require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'test1@test.com', password: 'testest', password_confirmation: 'testest')
    @post = Post.new(title: 'title', content: 'content', user: @user)
  end

  test "should create post v1" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { content: @post.content, title: @post.title, user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should create post v2" do
    assert Post.count == 0

    post posts_url, params: { post: { content: @post.content, title: @post.title, user_id: @post.user_id } }

    assert Post.count == 1
    assert post == @post

    assert_redirected_to post_url(Post.last)
  end

  teardown do
    Post.destroy_all
    User.destroy_all
  end
end
