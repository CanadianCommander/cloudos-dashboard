require 'mimemagic'

class SettingsController < ApplicationController

  # return the wallpaper
  def get_wallpaper
    data = img_response(SettingsService::WALLPAPER_PATH)
    type = MimeMagic.by_magic(data)
    send_data(data, type: type)
  end

  # set the wallpaper
  def set_wallpaper
  end
end
