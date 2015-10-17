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
end