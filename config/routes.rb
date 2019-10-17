Rails.application.routes.draw do
	scope 'api' do
		get 'settings/get_wallpaper'
		get 'settings/set_wallpaper'
		get 'programs/list'
	end
end
