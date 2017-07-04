require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include Devise::TestHelpers
  
  test "short usernames only" do
    @user = users(:user1)
    @user.username = "a" * 32
    assert !@user.valid?
  end

end
