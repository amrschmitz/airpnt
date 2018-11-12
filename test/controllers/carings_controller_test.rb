require 'test_helper'

class CaringsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get carings_new_url
    assert_response :success
  end

  test "should get create" do
    get carings_create_url
    assert_response :success
  end

  test "should get index" do
    get carings_index_url
    assert_response :success
  end

  test "should get show" do
    get carings_show_url
    assert_response :success
  end

  test "should get edit" do
    get carings_edit_url
    assert_response :success
  end

  test "should get update" do
    get carings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carings_destroy_url
    assert_response :success
  end

end
