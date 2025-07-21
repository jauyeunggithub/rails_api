require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should sign in with valid credentials" do
    user = users(:one)  # Assuming you have a fixture for user
    post user_session_url, params: { user: { email: user.email, password: 'password123' } }
    assert_response :success
  end

  test "should not sign in with invalid credentials" do
    post user_session_url, params: { user: { email: 'invalid@example.com', password: 'wrongpassword' } }
    assert_response :unauthorized
  end
end
