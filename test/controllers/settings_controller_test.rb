require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get get_wallpaper" do
    get settings_get_wallpaper_url
    assert_response :success
  end

  test "should get set_wallpaper" do
    get settings_set_wallpaper_url
    assert_response :success
  end

end
