require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Gradient < OmniAuth::Strategies::OAuth2
      option :name, 'gradient'

      option :client_options, {
          site: 'https://retireupapialpha.konnexme.com',
          authorize_url: 'https://loginalpha.konnexme.com/identity/connect/authorize',
          token_url: 'https://loginalpha.konnexme.com/identity/connect/token'
      }

      # uid{ raw_info['UserId'] }

      # info do
      #   {
      #     :first_name => raw_info['FirstName'],
      #     :last_name => raw_info['LastName'],
      #     :email => raw_info['EmailAddress']
      #   }
      # end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/userinfo').parsed
      end
    end
  end
end
