require "test_helper"

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calendar_index_url
    assert_response :success
  end

  test "should get create" do
    get calendar_create_url
    assert_response :success
  end

  test "should get edit" do
    get calendar_edit_url
    assert_response :success
  end
end
