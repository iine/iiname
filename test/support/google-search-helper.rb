# -*- coding: utf-8 -*-
module GoogleSearchHelper
  def create_search_stub(title="長嶋茂雄")
    stub_response = <<"EOJSON"
{
  "responseData": {
    "results": [
      {
        "GsearchResultClass": "GwebSearch",
        "unescapedUrl": "https://ja.wikipedia.org/wiki/%E9%95%B7%E5%B6%8B%E8%8C%82%E9%9B%84",
        "url": "https://ja.wikipedia.org/wiki/%25E9%2595%25B7%25E5%25B6%258B%25E8%258C%2582%25E9%259B%2584",
        "visibleUrl": "ja.wikipedia.org",
        "cacheUrl": "http://www.google.com/search?q=cache%3A7fefqOA7E0sJ%3Aja.wikipedia.org",
        "title": "#{title}",
        "titleNoFormatting": "#{title}",
        "content": "長嶋 茂雄"
      }
    ],
    "cursor": {
      "resultCount": "1",
      "pages": [
        {
          "start": "0",
          "label": 1
        }
      ],
      "estimatedResultCount": "",
      "currentPageIndex": 0,
      "moreResultsUrl": "http://www.google.com/search?oe=utf8&ie=utf8&source=uds&start=0&filter=1&hl=ja&q=#{title}",
      "searchResultTime": "0.31"
    }
  },
  "responseDetails": null,
  "responseStatus": 200
}
EOJSON
    end_response = <<"EOJSON"
{
  "responseData": {
    "results": [
    ],
    "cursor": {
      "resultCount": "0",
      "pages": [
        {
          "start": "0",
          "label": 1
        }
      ],
      "estimatedResultCount": "",
      "currentPageIndex": 0,
      "moreResultsUrl": "http://www.google.com/search?oe=utf8&ie=utf8&source=uds&start=0&filter=1&hl=ja&q=#{title}",
      "searchResultTime": "0.31"
    }
  },
  "responseDetails": null,
  "responseStatus": 400
}
EOJSON
    uri_template = Addressable::Template.new "www.google.com/uds/GwebSearch{?filter,hl,key,q,rsz,start,v}"
    stub_request(:get, uri_template).
      to_return({body: stub_response}, {body: end_response})
  end

  def create_trend_search_stub(names=["空条承太郎", "花京院典明"])
    stub_response = <<"EOJSON"
)]}'
{
  "storySummaries": {
    "trendingStories": [
      {
        "entityNames": #{names}
      }
    ]
  }
}
EOJSON
    uri_template = Addressable::Template.new "https://www.google.com/trends/api/stories/latest?cat=all&fi=0&fs=0&geo=JP&ri=300&rs=15&tz=-540"
    stub_request(:get, uri_template).to_return({body: stub_response})
  end

  # hot trend'
  def create_hot_trend_search_stub(name="空条承太郎")
    stub_response = <<"EOJSON"
{
  "trendsByDateList": [
    {
      "date": "20151030",
      "formattedDate": "2015年10月30日金曜日",
      "trendsList": [
        {
          "title": "#{name}",
          "titleLinkUrl": "/search?q=%E3%83%8F%E3%83%AD%E3%82%A6%E3%82%A3%E3%83%BC%E3%83%B3",
          "relatedSearchesList": [],
          "formattedTraffic": "100,000 人以上",
          "trafficBucketLowerBound": 100000,
          "hotnessLevel": 3,
          "hotnessColor": "#e68033",
          "imgUrl": "//t1.gstatic.com/images?q=tbn:ANd9GcQTs_betzO7mGoBnNtAXAc_-VS0MnsaPn-u68pljrAfBbgFX0WiSiRb9nj5JUSyVXijxiFyCi0",
          "imgSource": "毎日新聞",
          "imgLinkUrl": "http://mainichi.jp/shimen/news/20151031ddm041040096000c.html",
          "newsArticlesList": [
            {
              "title": "<b>ハロウィーン</b> 渋谷区が着替え用テント設置",
              "link": "http://www3.nhk.or.jp/news/html/20151031/k10010289731000.html",
              "source": "NHK",
              "snippet": "<b>ハロウィーン</b>で仮装した若者でにぎわう東京・渋谷では、区が着替えやメイクをするためのテントの設置を進めています。一方、仮装はできるだけ自宅で行い、ゴミは持ち帰るよう呼びかけています。 去年の<b>ハロウィーン</b>では、渋谷や六本木などの繁華街は、仮装をした大勢の人で&nbsp;..."
            },
            {
              "title": "東京都が<b>ハロウィーン</b>にカボチャのゴミ袋配布",
              "link": "http://www.nikkansports.com/general/news/1559851.html",
              "source": "日刊スポーツ",
              "snippet": "今日３１日は、日本の「秋イベント」として定着した<b>ハロウィーン</b>。３０日夜、人気キャラのコスプレに身を包んだ若者たちが、早くも「聖地」と呼ばれる東京・渋谷に集結した。逮捕者も出て大混乱した昨年以上の人出が予想される今回、渋谷区は初の試みとして着替えやメーク専用の&nbsp;..."
            }
          ],
          "startTime": 1446184800,
          "shareUrl": "http://www.google.com/trends/hottrends?stt=%E3%83%8F%E3%83%AD%E3%82%A6%E3%82%A3%E3%83%BC%E3%83%B3&std=20151030&pn=p4#a=20151030-%E3%83%8F%E3%83%AD%E3%82%A6%E3%82%A3%E3%83%BC%E3%83%B3",
          "date": "20151030",
          "exploreUrl": "/trends/explore#q=%E3%83%8F%E3%83%AD%E3%82%A6%E3%82%A3%E3%83%BC%E3%83%B3&date=now+7-d&geo=JP"
        }
      ]
    }
  ],
  "oldestVisibleDate": "20151028",
  "lastPage": false
}
EOJSON
    uri_template = Addressable::Template.new "https://www.google.com/trends/hottrends/hotItems{?ajax,pn,htv}"
    stub_request(:get, uri_template).to_return({body: stub_response})
  end

  # search stab for google Book search
  def create_google_book_search_stub(title="長嶋茂雄")
    stub_request(:get, "http://www.google.com/uds/GwebSearch?filter=1&hl=ja&key=notsupplied&q=MyTextOne&rsz=large&start=0&v=1.0").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end
end
