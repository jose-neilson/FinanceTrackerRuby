require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  fixtures :users
  include Devise::Test::IntegrationHelpers

  test "should redirect to login" do
    get root_url
    assert_redirected_to new_user_session_url
  end

  test "authenticated users can see index" do
    sign_in users(:one)

    get root_url
    assert_response :success
  end
end
