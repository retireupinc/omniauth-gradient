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

      uid { raw_info['Id'] || raw_info['ID'] }

      info do
        {
          :name => "#{raw_info['FirstName']} #{raw_info['LastName']}",
          :first_name => raw_info['FirstName'],
          :last_name => raw_info['LastName'],
          :email => raw_info['EmailAddress']
        }
      end

      extra do
        {
          'raw_info' => raw_info.inject({}) do |hash, key|
            hash[transform_key(key)] = transform_val(raw_info[key])
            hash
          end
        }
      end

      def transform_val(val)
        case val
        when Hash
          val.map { |k, v| [ transform_key(k), transform_val(v) ] }.to_h
        when Array
          val.map { |v| [ transform_val(v) ] }
        else
          val
        end
      end

      def transform_key(key)
        key.underscore
      end

      def raw_info
        @raw_info ||= access_token.get('/advisors', ).parsed
      end
    end
  end
end
