require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  test "should send post created email" do
    post = posts(:one)  # Assuming you have a fixture for post
    email = PostMailer.with(post: post).post_created_email
    assert_emails 1 do
      email.deliver_now
    end
  end
end
