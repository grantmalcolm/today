require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    get root_path
    assert_template 'pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", members_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
  end

end
