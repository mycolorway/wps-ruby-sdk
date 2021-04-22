require "wps/version"
require 'redis'
require 'active_support/all'
require 'wps/config'
require 'wps/helper'

lib_path = "#{File.dirname(__FILE__)}/wps"
Dir["#{lib_path}/apis/*.rb"].each { |path| require path }

require 'wps/api'

module Wps
  API_BASE_URL = 'https://openapi.wps.cn/'.freeze

  # Exceptions
  class RedisNotConfigException < RuntimeError; end
  class AppNotConfigException < RuntimeError; end
  class AccessTokenExpiredError < RuntimeError; end
  class AccessTokenInvalidError < RuntimeError; end
  class ResultErrorException < RuntimeError; end
  class ResponseError < StandardError
    attr_reader :error_code
    def initialize(errcode, errmsg='')
      @error_code = errcode
      super "(#{error_code}) #{errmsg}"
    end
  end
end
