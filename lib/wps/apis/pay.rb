module Wps
  module Apis
    module Pay
      # 判断用户是否有相关权益
      def service_usable(access_token:, openid:, total_num: 0)
        request.post 'oauthapi/v2/vas/service/usable', {
          appid: app_id,
          service_id: service_id,
          total_num: total_num,
          access_token: access_token,
          openid: openid
        }
      end

      # 预下单接口
      def preorder(access_token:, openid:, billno:, position:, client_ip:, subject: nil, total_num: 0)
        request.post 'oauthapi/v2/vas/pay/preorder', {
          appid: app_id,
          service_id: service_id,
          total_num: total_num,
          access_token: access_token,
          openid: openid,
          billno: billno,
          subject: subject,
          position: position,
          client_ip: client_ip
        }
      end

      # 使用用户自身权益
      def service_use(access_token:, openid:, billno:, total_num: 0)
        request.post 'oauthapi/v2/vas/service/use', {
          appid: app_id,
          service_id: service_id,
          total_num: total_num,
          access_token: access_token,
          openid: openid,
          billno: billno
        }
      end

      # 零售下单
      def customorder(access_token:, openid:, billno:, subject:, position:, payment: 'qrcode', total_fee: 0, count: 1)
        request.post 'oauthapi/v2/vas/pay/customorder', {
          appid: app_id,
          service_id: service_id,
          payment: payment,
          access_token: access_token,
          openid: openid,
          billno: billno,
          subject: subject,
          position: position,
          total_fee: total_fee,
          count: count
        }
      end

      # 添加会员
      def member_add(access_token:, openid:, orderid:, memberid:, days:, phone:)
        request.post 'oauthapi/v2/vas/pay/member/add', {
          appid: app_id,
          service_id: service_id,
          openid: openid,
          orderid: orderid,
          access_token: access_token,
          memberid: memberid,
          days: days,
          phone: phone
        }
      end

      # 获取标签
      def banner_open(access_token:, mod:, position:)
        request.get 'oauthapi/v2/vas/banner/open', params: {
          appid: app_id,
          mod: mod,
          access_token: access_token,
          position: position,
        }
      end
    end
  end
end
