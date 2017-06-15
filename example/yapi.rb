# Coding: UTF-8
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yapi'

api_key = ""

maservice = Yapi::MAService.new(api_key)
maservice.configure config={
  :results=>"uniq"
}
parse = maservice.parse "庭には２羽にわとりがいる"
puts parse
  
jimservice = Yapi::JIMService.new(api_key)
puts jimservice.conversion "きょうはいいてんきです"

furiganasevice = Yapi::FuriganaService.new(api_key)
puts furiganasevice.furigana "今日はいい天気ですね"

kouseiservice = Yapi::KouseiService.new(api_key)
puts kouseiservice.kousei "人事移動小形飛行機"

daservice = Yapi::DAService.new(api_key)
puts daservice.parse "うちの庭には２羽にわとりがいる"

keyphrase = Yapi::KeyphraseService.new(api_key)
puts keyphrase.extract "山梨県と北海道に行きたい"

geocoder = Yapi::OpenLocalPlatform::GeoCoder.new(api_key)
puts geocoder.geoCoder

regeocoder = Yapi::OpenLocalPlatform::ReverseGeoCoder.new(api_key)
puts regeocoder.geoCoder 35.68381981,139.77456498

weather = Yapi::Weather.new(api_key)
puts weather.place("139.732293,35.663613")

contentsgeocoder = Yapi::OpenLocalPlatform::ContentsGeoCoder.new(api_key)
puts contentsgeocoder.contentsGeoCoder "秋葉原"

peaceinfo = Yapi::PlaceInfo.new(api_key)
puts peaceinfo.get "35.66521320007564","139.7300114513391"
