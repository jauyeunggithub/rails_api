require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should create post" do
    post posts_url, params: { post: { title: 'Test Post', content: 'This is a test post' } }
    assert_response :created
    json_response = JSON.parse(@response.body)
    assert_equal 'Test Post', json_response['title']
  end

  test "should show post" do
    post = posts(:one)  # Assuming you have a fixture for post
    get post_url(post)
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal post.title, json_response['title']
  end

  test "should update post" do
    post = posts(:one)
    patch post_url(post), params: { post: { title: 'Updated Title' } }
    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal 'Updated Title', json_response['title']
  end

  test "should destroy post" do
    post = posts(:one)
    assert_difference('Post.count', -1) do
      delete post_url(post)
    end
    assert_response :no_content
  end
end
