Rails.application.routes.draw do
	scope 'api' do
		get 'settings/get_wallpaper'
		get 'settings/set_wallpaper'

		get 'programs/list'

		scope 'program/:program_id' do
			get 'running_instances', to: 'programs#get_running_instances'
		end
	end
end
