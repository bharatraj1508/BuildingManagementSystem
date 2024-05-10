require "test_helper"

class AccessManagement::AssignBuildingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get access_management_assign_buildings_new_url
    assert_response :success
  end

  test "should get create" do
    get access_management_assign_buildings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get access_management_assign_buildings_destroy_url
    assert_response :success
  end
end
