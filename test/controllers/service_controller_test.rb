require 'test_helper'

class ServiceControllerTest < ActionController::TestCase
  test "should get server" do
    get :server
    assert_response :success
  end

  test "should get link" do
    get :link
    assert_response :success
  end

  test "should get router" do
    get :router
    assert_response :success
  end

end
