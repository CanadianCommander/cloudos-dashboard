class ProgramsController < ApplicationController

	def initialize
		@program_service = CloudosApi::ProgramService.instance
	end

	def list
		begin
			render json: success_response(@program_service.get_all_programs)
		rescue Exception => e
			Rails.logger.error("Error when getting programs list #{e.to_s}\n#{e.backtrace.join("\n")}")
			render json: error_response("Error getting programs list: #{e.to_s}"), status: 500
		end
	end

end