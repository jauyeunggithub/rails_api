require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  def setup
    # Adding a password to ensure the User is created successfully
    @user = User.create!(email: "testuser@example.com", password: "password123", password_confirmation: "password123")
    @post = Post.create!(title: "Sample Post", content: "This is a test post", user: @user)
  end

  test "new_post_email sends email" do
    email = PostMailer.new_post_email(@post)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['no-reply@example.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal "New Post: #{@post.title}", email.subject
  end

  test "new_post_email body includes post content" do
    email = PostMailer.new_post_email(@post)
    email.deliver_now

    assert_includes email.body.to_s, @post.content
  end
end
