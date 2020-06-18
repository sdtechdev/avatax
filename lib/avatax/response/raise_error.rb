module Avatax
  class Response
    class RaiseError < Faraday::Response::Middleware
      ServerErrorStatuses = (500...600).freeze

      def on_complete(env)
        case env[:status]
        when ServerErrorStatuses
          raise Faraday::ServerError, response_values(env)
        end
      end

      def response_values(env)
        { status: env.status, headers: env.response_headers, body: env.body }
      end
    end
  end
end
