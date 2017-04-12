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
    res = self.camelize
    res[0].downcase + res[1..-1]
  end
end

class Hash
  def self.rebrandly_stringify_keys(hash)
    stringified_hash = {}
    hash.each do |k, v|
      stringified_hash[k.to_s] = v.is_a?(Hash) ? rebrandly_stringify_keys(v) : v
    end
    stringified_hash
  end
end
