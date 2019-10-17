require 'singleton'

class CloudosApi::ProgramService
	include CloudosApi::NetUtil
	include Singleton

	# get a list of all installed programs
	def get_all_programs
		do_get_request('/system/programs/list')
	end

end
