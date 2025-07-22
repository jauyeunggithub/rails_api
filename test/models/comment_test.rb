require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should belong to a commentable object" do
    post = Post.create!(title: "Test Post", content: "Test content")
    comment = post.comments.create!(content: "Test comment")

    assert_equal post, comment.commentable, "Comment's commentable should be the post"
    assert_instance_of Post, comment.commentable, "Comment's commentable should be a Post instance"
  end

  test "should not save comment without commentable" do
    comment = Comment.new(content: "Test content without commentable")
    assert_not comment.save, "Saved the comment without a commentable object"
  end
end
