module Wps
  module Apis
    module Kopen
      # 获取公众号信息(是否关注)
      # wps_vip | WPS会员公众号
      # wps_pdf | 金山PDF公众号
      # wps_docer | WPS稻壳公众号
      # wps_docer100 |WPS稻壳知稻公众号
      # wps_docer_school |WPS稻壳校园公众号
      # wps_xinde | 心得公众号
      # wps_learning| WPS小技巧
      # wps_xiutang | WPS秀堂
      # vip_zcgl | 金山文档
      # office_helper | 办公助手
      def mp_subscribe(access_token:, mpid: :wps_vip)
        url = "kopen/pay/v1/wx_adapter/mp/subscribe/#{mpid}"
        request.get url, headers(url, { access_token: access_token })
      end

      # 推送公众号消息
      def msg_apipush(access_token:, msg_data:, msg_type: :docer_aliapp_gui_non_pay)
        request.post 'kopen/pay/v1/msg/apipush', headers('kopen/pay/v1/msg/apipush', {
          access_token: access_token,
          msg_type: msg_type,
          msg_data: msg_data
        })
      end

      def headers(url, params)
        content_type = 'application/json'
        content_md5 = Digest::MD5.hexdigest(params.to_json)
        date = Time.now.httpdate
        authorization = "WPS-3:#{app_id}:#{Digest::SHA1.hexdigest("#{app_key}#{content_md5}#{url}#{content_type}#{date}")}"
        {
          params: params,
          'Content-type' => content_type,
          'X-Auth' => authorization,
          'Date' => date,
          'Content-Md5' => content_md5
        }
      end
    end
  end
end
