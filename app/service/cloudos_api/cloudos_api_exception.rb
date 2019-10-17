module CloudosApi
	class CloudosApiException < Exception

		CLOUDOS_API_ERROR = 'cloudos_api_error'.freeze

		attr_accessor :error_code, :cloudos_response

		def initialize(msg, error_code, cloudos_response)
			super(msg)
			@error_code = error_code
			@cloudos_response = cloudos_response
		end

		def to_s
			"#{@msg.to_s} #{@error_code.to_s} \n #{@cloudos_response.to_s}"
		end
	end
end