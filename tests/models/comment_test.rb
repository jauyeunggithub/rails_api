require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should belong to post" do
    post = posts(:one)
    comment = post.comments.create(content: "Great post!")
    assert_equal post, comment.commentable
  end

  test "should belong to image" do
    image = images(:one)  # Assuming you have a fixture for image
    comment = image.comments.create(content: "Nice image!")
    assert_equal image, comment.commentable
  end
end
