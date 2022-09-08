require "test_helper"

class GameroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gamerooms_show_url
    assert_response :success
  end
end
