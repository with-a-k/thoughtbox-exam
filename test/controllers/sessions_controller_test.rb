require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get destroycreate" do
    get :destroycreate
    assert_response :success
  end

end
