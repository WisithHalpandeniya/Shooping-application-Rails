require 'test_helper'

class SavedControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get saved_create_url
    assert_response :success
  end

end
