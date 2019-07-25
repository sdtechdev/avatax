module Avatax
  module Api
    ##
    # Certificates client
    # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Certificates/
    #
    class Certificates < Base
      ##
      # Get a certificate by id within a company
      # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Certificates/GetCertificate/
      #
      # @param company_code [String] The company_code in avatax.
      # @param certificate_id [String] The certificate id in avatax.
      # @param args [Hash] Arguments for avatax.
      # @return [Avatax::Response]
      #
      def find_by_id(company_code, certificate_id, args = {})
        raise ArgumentError, 'company_code is required' if company_code.blank?
        raise ArgumentError, 'certificate_id is required' if certificate_id.blank?

        resp = connection.get "/api/v2/companies/#{company_code}/certificates/#{certificate_id}", args
        handle_response(resp)
      end

      ##
      # List certificate exposure zones
      # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Definitions/ListCertificateExposureZones/
      #
      # @return [Avatax::Response]
      #
      def exposure_zones
        resp = connection.get '/api/v2/definitions/certificateexposurezones'
        handle_response(resp)
      end
    end
  end
end
