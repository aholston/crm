require 'test_helper'

class ShowingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get showings_create_url
    assert_response :success
  end

end
