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
    end
  end
end
