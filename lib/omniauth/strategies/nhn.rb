require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class NHN < OmniAuth::Strategies::OAuth2
      option :client_options, {
             site: 'https://helseid-sts.test.nhn.no',
             authorize_url: 'https://helseid-sts.test.nhn.no/connect/authorize',
             token_url: 'https://helseid-sts.test.nhn.no/connect/token',
             redirect_uri: 'http://localhost:3000/users/auth/nhn/callback'
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          if request.params['client_options']
            params[:client_options] = request.params['client_options']
          end
        end
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'name' => raw_info['name'],
          'email' => raw_info['email']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.params['data']
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end