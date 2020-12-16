require "erb"

module Wps
  module Apis
    module Authen
      def index(redirect_uri, state, scope = :user_info)
        uri = ERB::Util.url_encode(redirect_uri)
        "#{URI::join(API_BASE_URL, 'oauthapi/v2/authorize')}?redirect_uri=#{uri}&app_id=#{app_id}&state=#{state}&response_type=code&scope=#{scope}"
      end

      def access_token(code)
        request.get 'oauthapi/v2/token', params: { code: code, appid: app_id, appkey: app_key }
      end

      def refresh_access_token(token)
        request.post 'oauthapi/v2/token/refresh', params: { refresh_token: token, appid: app_id, appkey: app_key }
      end

      def user_info(access_token, openid)
        request.get 'oauthapi/v3/user', params: { appid: app_id, access_token: access_token, openid: openid }
      end
    end
  end
end
