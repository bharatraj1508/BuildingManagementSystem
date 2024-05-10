require "test_helper"

class UnitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get unit_index_url
    assert_response :success
  end

  test "should get show" do
    get unit_show_url
    assert_response :success
  end

  test "should get create" do
    get unit_create_url
    assert_response :success
  end

  test "should get update" do
    get unit_update_url
    assert_response :success
  end

  test "should get destroy" do
    get unit_destroy_url
    assert_response :success
  end
end
