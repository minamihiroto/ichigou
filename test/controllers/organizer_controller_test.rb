require 'test_helper'

class OrganizerControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get organizer_profile_url
    assert_response :success
  end

end
