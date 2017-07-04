require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get userhome" do
    get :userhome
    assert_response :success
  end

  test "should get members" do
    get :members
    assert_response :success
  end

  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

end