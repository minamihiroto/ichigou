require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get participants_top_url
    assert_response :success
  end

end
