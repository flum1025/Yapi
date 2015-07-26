path = File.expand_path('../', __FILE__)
require File.join(path, 'client.rb')
require 'open-uri'
require 'json'

module Yapi
  class Weather
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
    
    def place coordinates
      req_url = "http://weather.olp.yahooapis.jp/v1/place?appid=#{@client.get_api_key}#{@client.build_url(self.config)}&coordinates=#{coordinates}"
      return @client.xml_to_json(open(URI.encode(req_url)).read)
    end
  end
end