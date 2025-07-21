require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should create comment on post" do
    post = posts(:one)  # Assuming you have a fixture for post
    post comments_url, params: { comment: { content: 'Great post!', commentable_type: 'Post', commentable_id: post.id } }
    assert_response :created
    json_response = JSON.parse(@response.body)
    assert_equal 'Great post!', json_response['content']
  end

  test "should create comment on image" do
    image = images(:one)  # Assuming you have a fixture for image
    post comments_url, params: { comment: { content: 'Nice image!', commentable_type: 'Image', commentable_id: image.id } }
    assert_response :created
    json_response = JSON.parse(@response.body)
    assert_equal 'Nice image!', json_response['content']
  end
end
