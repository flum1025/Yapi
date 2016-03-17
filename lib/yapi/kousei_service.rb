require "yapi/client"
require 'open-uri'
require 'json'

module Yapi
  class KouseiService
    attr_accessor :config
    
    def initialize(api_key)
      @client = Client.new(api_key)
      self.config = {}
    end
    
    def configure(options = {})
      options.each do |key, value|
        self.config[key] = value
      end
    end
    
    def kousei sentence
      req_url = "http://jlp.yahooapis.jp/KouseiService/V1/kousei?appid=#{@client.get_api_key}#{@client.build_url(self.config)}&sentence=#{sentence}"
      return @client.xml_to_json(open(URI.encode(req_url)).read)[:ResultSet][:Result]
    end
  end
end