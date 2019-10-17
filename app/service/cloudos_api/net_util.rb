
module CloudosApi
	module NetUtil
		CLOUDOS_API_BASE = 'https://172.17.0.1/api'.freeze
		CLOUDOS_API_SUCCESS_STATUS = 'ok'.freeze


		def do_get_request(url)
			response = HTTParty.get(CLOUDOS_API_BASE + url, :verify => Rails.application.config.verify_ssl)

			if is_response_success(response)
				return (JSON.parse(response.body).deep_symbolize_keys)[:data]
			else
				raise CloudosApiException.new("Cloudos Api error", CloudosApiException::CLOUDOS_API_ERROR, response)
			end
		end

		def is_response_success(response)
			if response.code == 200
				begin
					json = JSON.parse(response.body).deep_symbolize_keys
					if json[:status] == CLOUDOS_API_SUCCESS_STATUS
						return true
					end
				rescue JSON::ParseError
					return false
				end
			end
			return false
		end
	end
end