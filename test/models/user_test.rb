require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    user = User.new(email: 'test@example.com', password: 'password123')
    assert user.valid?
  end

  test "should not be valid without email" do
    user = User.new(password: 'password123')
    assert_not user.valid?
  end

  test "should not be valid without password" do
    user = User.new(email: 'test@example.com')
    assert_not user.valid?
  end
end
