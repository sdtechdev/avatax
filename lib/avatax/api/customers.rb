module Avatax
  module Api
    ##
    # Customers client
    # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Customers/
    #
    class Customers < Base
      ##
      # Create a customer within a company.
      # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Customers/CreateCustomers/
      #
      # @param company_code [String] The company_code in avatax.
      # @param args [Hash] Arguments for avatax.
      # @return [Avatax::Response]
      #
      def create(company_code, args = {})
        raise ArgumentError, 'company_code is required' if company_code.blank?

        resp = connection.post "api/v2/companies/#{company_code}/customers", args
        handle_response(resp)
      end

      ##
      # List certificates for a customer within a company.
      # @see https://developer.avalara.com/api-reference/avatax/rest/v2/methods/Customers/ListCertificatesForCustomer/
      #
      # @param company_code [String] The company_code in avatax.
      # @param customer_code [String] The customer_code in avatax.
      # @param args [Hash] Arguments for avatax.
      # @return [Avatax::Response]
      #
      def certificates(company_code, customer_code, args = {})
        raise ArgumentError, 'company_code is required' if company_code.blank?
        raise ArgumentError, 'customer_code is required' if customer_code.blank?

        resp = connection.get "api/v2/companies/#{company_code}/customers/#{customer_code}/certificates", args
        handle_response(resp)
      end
    end
  end
end
