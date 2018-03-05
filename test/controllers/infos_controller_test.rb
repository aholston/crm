require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get infos_update_url
    assert_response :success
  end

end
