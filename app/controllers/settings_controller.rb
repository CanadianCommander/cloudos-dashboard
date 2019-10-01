require 'mimemagic'

class SettingsController < ApplicationController

  # return the wallpaper
  def get_wallpaper
    begin
      data = img_response(SettingsService::WALLPAPER_PATH)
      type = MimeMagic.by_magic(data)
      send_data(data, type: type, status: 200, disposition: 'inline')
    rescue Exception => e
      render json: error_response(e.to_s), status: 500
    end
  end

  # set the wallpaper
  def set_wallpaper
  end
end
