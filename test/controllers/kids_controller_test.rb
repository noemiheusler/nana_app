require 'test_helper'

class KidsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get kids_new_url
    assert_response :success
  end

  test "should get create" do
    get kids_create_url
    assert_response :success
  end

  test "should get destroy" do
    get kids_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get kids_edit_url
    assert_response :success
  end

  test "should get update" do
    get kids_update_url
    assert_response :success
  end

end
