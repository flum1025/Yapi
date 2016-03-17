require "yapi/client"
require 'open-uri'
require 'json'

module Yapi
  class PlaceInfo
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
    
    def get lat,lon
      req_url = "http://placeinfo.olp.yahooapis.jp/V1/get?appid=#{@client.get_api_key}#{@client.build_url(self.config)}&output=xml&lat=#{lat}&lon=#{lon}"
      return @client.xml_to_json(open(URI.encode(req_url)).read)
    end
  end
end