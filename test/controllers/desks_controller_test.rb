require 'test_helper'

class DesksControllerTest < ActionDispatch::IntegrationTest
  test "should get my_desks" do
    get desks_my_desks_url
    assert_response :success
  end

  test "should get index" do
    get desks_index_url
    assert_response :success
  end

  test "should get show" do
    get desks_show_url
    assert_response :success
  end

  test "should get new" do
    get desks_new_url
    assert_response :success
  end

  test "should get create" do
    get desks_create_url
    assert_response :success
  end

  test "should get edit" do
    get desks_edit_url
    assert_response :success
  end

  test "should get update" do
    get desks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get desks_destroy_url
    assert_response :success
  end

end
