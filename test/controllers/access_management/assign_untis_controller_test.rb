require "test_helper"

class AccessManagement::AssignUntisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get access_management_assign_untis_new_url
    assert_response :success
  end

  test "should get create" do
    get access_management_assign_untis_create_url
    assert_response :success
  end

  test "should get destroy" do
    get access_management_assign_untis_destroy_url
    assert_response :success
  end
end
