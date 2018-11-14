require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Gradient < OmniAuth::Strategies::OAuth2
      option :name, 'gradient'

      option :client_options, {
          site: 'https://api.konnexme.com',
          authorize_url: 'https://app.konnexme.com/oauth/authorize',
          token_url: 'https://app.konnexme.com/oauth/token'
      }
    end
  end
end
