require "yapi/client"
require 'open-uri'
require 'json'

module Yapi
  class OpenLocalPlatform
    class GeoCoder
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
      
      def geoCoder
        req_url = "https://map.yahooapis.jp/geocode/V1/geoCoder?appid=#{@client.get_api_key}#{@client.build_url(self.config)}"
        return @client.xml_to_json(open(URI.encode(req_url)).read)
      end
    end
    
    class ReverseGeoCoder
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
      
      def geoCoder lat,lon
        req_url = "https://map.yahooapis.jp/geoapi/V1/reverseGeoCoder?appid=#{@client.get_api_key}#{@client.build_url(self.config)}&lat=#{lat}&lon=#{lon}"
        return @client.xml_to_json(open(URI.encode(req_url)).read)
      end
    end
    
    class ContentsGeoCoder
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
      
      def contentsGeoCoder query
        req_url = "https://map.yahooapis.jp/geocode/cont/V1/contentsGeoCoder?appid=#{@client.get_api_key}#{@client.build_url(self.config)}&query=#{query}"
        return @client.xml_to_json(open(URI.encode(req_url)).read)
      end
    end
  end
end
