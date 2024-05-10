require "test_helper"

class AccessManagementControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get access_management_show_url
    assert_response :success
  end

  test "should get update" do
    get access_management_update_url
    assert_response :success
  end

  test "should get destroy" do
    get access_management_destroy_url
    assert_response :success
  end
end
