require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get home_test_url
    assert_response :success
  end
end
