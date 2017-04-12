require 'rebrandly/version'
require 'rebrandly/configuration'
require 'rebrandly/api'
require 'rebrandly/element'
require 'rebrandly/domain'
require 'rebrandly/creator'
require 'rebrandly/integration'
require 'rebrandly/link'

module Rebrandly
  class << self
    attr_accessor :configuration
  end

  def self.api_key
    configuration.api_key
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

class String
  def rebrandly_underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  def rebrandly_camelize
    self.split('_').collect(&:capitalize).join
  end

  def rebrandly_lower_camelize
    res = self.rebrandly_camelize
    res[0].downcase + res[1..-1]
  end
end
