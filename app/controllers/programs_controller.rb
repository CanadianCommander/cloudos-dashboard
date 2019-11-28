class ProgramsController < ApplicationController

	def initialize
		@program_service = CloudosApi::ProgramService.instance
	end

	def list
		begin
			render json: success_response(@program_service.get_all_programs), status: 200
		rescue Exception => e
			Rails.logger.error("Error when getting programs list #{e.to_s}\n#{e.backtrace.join("\n")}")
			render json: error_response("Error getting programs list: #{e.to_s}"), status: 500
		end
	end

	def get_running_instances
		params.require("program_id")

		program_id = params["program_id"]
		begin
			render json: success_response(@program_service.get_running_instances(program_id)), status: 200
		rescue Exception => e
			Rails.logger.error("Error when getting running instance list for program [#{program_id}] #{e.to_s}\n#{e.backtrace.join("\n")}")
			render json: error_response("Error getting running instance list for program [#{program_id}]: #{e.to_s}"), status: 500
		end
	end

end