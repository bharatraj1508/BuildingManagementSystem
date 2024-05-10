require "test_helper"

class AccessManagement::AccessUnitsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get access_management_access_units_new_url
    assert_response :success
  end

  test "should get create" do
    get access_management_access_units_create_url
    assert_response :success
  end

  test "should get destroy" do
    get access_management_access_units_destroy_url
    assert_response :success
  end
end
