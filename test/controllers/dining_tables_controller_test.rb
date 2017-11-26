require 'test_helper'

class DiningTablesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dining_tables_new_url
    assert_response :success
  end

  test "should get create" do
    get dining_tables_create_url
    assert_response :success
  end

  test "should get edit" do
    get dining_tables_edit_url
    assert_response :success
  end

  test "should get update" do
    get dining_tables_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dining_tables_destroy_url
    assert_response :success
  end

end
