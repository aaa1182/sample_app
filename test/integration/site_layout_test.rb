require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end


  test "layout links" do
    get root_path
    assert_template "static_pages/home"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path, count: 1
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", contact_path, count: 1
    assert_select "a[href=?]", signup_path, count: 1
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end

  test "layout links when logged in user" do
    log_in(@user)
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path, count: 1
    assert_select "a[href=?]", about_path, count: 1
    assert_select "a[href=?]", contact_path, count: 1
    assert_select "a[href=?]", signup_path, count: 1
    assert_select "a[href=?]", users_path, count: 1
    assert_select "a[href=?]", user_path(@user), count: 1
    assert_select "a[href=?]", edit_user_path(@user), count: 1
    assert_select "a[href=?]", logout_path, count: 1
  end
end
