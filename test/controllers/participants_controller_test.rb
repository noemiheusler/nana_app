require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get participants_create_url
    assert_response :success
  end

  test "should get destroy" do
    get participants_destroy_url
    assert_response :success
  end

end
