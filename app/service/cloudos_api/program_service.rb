require 'singleton'

class CloudosApi::ProgramService
	include CloudosApi::NetUtil
	include Singleton

	# get a list of all installed programs
	def get_all_programs
		do_get_request('/system/programs/list')
	end

	def get_running_instances(program_id)
		instances = []
		do_get_request("/system/program/#{program_id}/containers").each do |instance|
			if instance[:status].to_i == 0
				instances.push({
						instance_id: instance[:id]
			 	})
			end
		end
		return instances
	end

end
