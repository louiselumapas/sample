require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path #from the routes bc /signup
    assert_response :success
  end

end
