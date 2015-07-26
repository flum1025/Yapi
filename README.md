Yapi
===========

##What is it?

rubyで書かれたYahooAPIのクライアントライブラリです。
apiについての説明は[ドキュメント一覧](http://developer.yahoo.co.jp/sitemap/)へ  
公式サイトは[Yahoo!デベロッパーネットワーク](http://developer.yahoo.co.jp/)  

動作確認はubuntu14.04 ruby1.9.3とOS X Yosemite ruby2.0.0です。

##How to Use
まず、公式サイトからAPIキーを取得してください。  
形態素解析する場合はrequireしてから

```
maservice = Yapi::MAService.new(api_key)
puts maservice.parse "庭には２羽にわとりがいる"
```

たったこれだけで形態素解析ができます。   
詳しいパラメータ等は、公式サイトを参照して、
```
maservice.configure config={  
:results=>"uniq"  
}  
```
の様な感じでセットしてください。

##Supported APIs

>テキスト解析  

>>日本語形態素解析  

>>かな漢字変換  

>>ルビ振り  

>>校正支援  

>>日本語係り受け解析  

>>キーフレーズ抽出  

>地図・地域情報 

>>Yahoo!ジオコーダAPI  

>>Yahoo!リバースジオコーダAPI  

>気象情報API  

>場所情報API    

>コンテンツジオコーダAPI  

##Notice
エラーが発生した場合はYahooErrorをraiseします。  
/yapi/yapi.rbをrequireすることですべてのライブラリを呼び出すことができますが、  
最小限だけにとどめたい場合は/yapi/lib/の中から必要なものだけrequireしてください。   
yapi-example.rbは使用例ですので、参考にしてみてください。  


質問等ありましたらTwitter:[@flum_](https://twitter.com/flum_)までお願いします。

##License

The MIT License

-------