require 'test_helper'

class AcademiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academy = academies(:one)
  end

  test "should get index" do
    get academies_url
    assert_response :success
  end

  test "should get new" do
    get new_academy_url
    assert_response :success
  end

  test "should create academy" do
    assert_difference('Academy.count') do
      post academies_url, params: { academy: { name: @academy.name } }
    end

    assert_redirected_to academy_url(Academy.last)
  end

  test "should show academy" do
    get academy_url(@academy)
    assert_response :success
  end

  test "should get edit" do
    get edit_academy_url(@academy)
    assert_response :success
  end

  test "should update academy" do
    patch academy_url(@academy), params: { academy: { name: @academy.name } }
    assert_redirected_to academy_url(@academy)
  end

  test "should destroy academy" do
    assert_difference('Academy.count', -1) do
      delete academy_url(@academy)
    end

    assert_redirected_to academies_url
  end
end
