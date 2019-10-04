require 'test_helper'

class Profile::MyprofilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_myprofiles_index_url
    assert_response :success
  end

end
