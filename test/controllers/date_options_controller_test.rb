require 'test_helper'

class DateOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @date_option = date_options(:one)
  end

  test "should get index" do
    get date_options_url
    assert_response :success
  end

  test "should get new" do
    get new_date_option_url
    assert_response :success
  end

  test "should create date_option" do
    assert_difference('DateOption.count') do
      post date_options_url, params: { date_option: {  } }
    end

    assert_redirected_to date_option_url(DateOption.last)
  end

  test "should show date_option" do
    get date_option_url(@date_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_date_option_url(@date_option)
    assert_response :success
  end

  test "should update date_option" do
    patch date_option_url(@date_option), params: { date_option: {  } }
    assert_redirected_to date_option_url(@date_option)
  end

  test "should destroy date_option" do
    assert_difference('DateOption.count', -1) do
      delete date_option_url(@date_option)
    end

    assert_redirected_to date_options_url
  end
end
