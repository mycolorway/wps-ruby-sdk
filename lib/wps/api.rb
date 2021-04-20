require 'wps/request'

module Wps
  class Api
    include Helper

    api_mount :authen
    api_mount :pay

    attr_reader :app_id, :app_key, :service_id

    def initialize(options = {})
      @app_id = options.delete(:app_id) || Wps.config.default_app_id
      @app_key = options.delete(:app_key) || Wps.config.default_app_key
      @service_id = options.delete(:service_id) || Wps.config.default_service_id
      raise AppNotConfigException if @app_id.nil? || @app_id.empty?
      @options = options
    end

    def request
      @request ||= Wps::Request.new(false)
    end

    private

    class << self
      def default
        @default ||= new(
          app_id: Wps.config.default_app_id,
          app_key: Wps.config.default_app_key,
          service_id: Wps.config.default_service_id
        )
      end
    end
  end
end
