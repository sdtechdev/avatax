module Avatax
  module Api
    ##
    # Certificate Requests client
    # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/CertExpressInvites/
    #
    class CertificateRequests < Base
      ##
      # Create a certificate request for a customer within a company.
      # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/CertExpressInvites/CreateCertExpressInvitation/
      #
      # @param company_code [String] The company_code in avatax.
      # @param customer_code [String] The customer_code in avatax.
      # @param args [Hash] Arguments for avatax.
      # @return [Avatax::Response]
      #
      def create(company_code, customer_code, args = {})
        raise ArgumentError, 'company_code is required' if company_code.blank?
        raise ArgumentError, 'customer_code is required' if customer_code.blank?

        resp = connection.post "api/v2/companies/#{company_code}/customers/#{customer_code}/certexpressinvites", args
        handle_response(resp)
      end
    end
  end
end
