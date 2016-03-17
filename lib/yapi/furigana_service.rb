require "yapi/client"
require 'open-uri'
require 'json'

module Yapi
  class FuriganaService
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
    
    def furigana sentence
      req_url = "http://jlp.yahooapis.jp/FuriganaService/V1/furigana?appid=#{@client.get_api_key}#{@client.build_url(self.config)}&sentence=#{sentence}"
      return @client.xml_to_json(open(URI.encode(req_url)).read)[:ResultSet][:Result]
    end
  end
end