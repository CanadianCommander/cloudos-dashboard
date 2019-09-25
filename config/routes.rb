Rails.application.routes.draw do
  scope 'api' do
    get 'settings/get_wallpaper'
    get 'settings/set_wallpaper'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
