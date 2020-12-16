require 'wps/request'

module Wps
  class Api
    include Helper

    api_mount :authen

    attr_reader :app_id, :app_key

    def initialize(options = {})
      @app_id = options.delete(:app_id) || Wps.config.default_app_id
      @app_key = options.delete(:app_key) || Wps.config.default_app_key
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
          app_key: Wps.config.default_app_key
        )
      end
    end
  end
end
