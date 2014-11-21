require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "VenomDB"
  end

  test "should get data" do
    get :data
    assert_response :success
    assert_select "title", "Data | VenomDB"
  end

  test "should get download" do
    get :download
    assert_response :success
    assert_select "title", "Download | VenomDB"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | VenomDB"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | VenomDB"
  end

end
