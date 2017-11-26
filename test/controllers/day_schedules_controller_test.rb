require 'test_helper'

class DaySchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get day_schedules_edit_url
    assert_response :success
  end

  test "should get update" do
    get day_schedules_update_url
    assert_response :success
  end

end
