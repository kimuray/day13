require 'test_helper'

class LandingPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get landing_pages_top_url
    assert_response :success
  end

end
