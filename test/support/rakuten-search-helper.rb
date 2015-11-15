# -*- coding: utf-8 -*-
module RakutenSearchHelper
  def create_rakuten_search_stub(title="長嶋茂雄", count=1)
    response = <<EOS
{
  "count": 1,
  "page": 1,
  "first": 1,
  "last": 1,
  "hits": 1,
  "carrier": 0,
  "pageCount": 1,
  "Items": [
   {
      "Item": {
        "title": "長嶋茂雄",
        "titleKana": "ナガシマ シゲオ",
        "subTitle": "燃えた、打った、走った！",
        "subTitleKana": "モエタ ウッタ ハシッタ",
        "seriesName": "人間の記録",
        "seriesNameKana": "ニンゲン ノ キロク",
        "contents": "",
        "author": "長嶋茂雄",
        "authorKana": "ナガシマ,シゲオ",
        "publisherName": "日本図書センター",
        "size": "全集・双書",
        "isbn": "9784820542810",
        "itemCaption": "背番号「３」ついに復活！ミスター 唯一の自伝！１９７４年、講談社から発行されたものを底本とする。",
        "salesDate": "1997年06月",
        "itemPrice": 1944,
        "listPrice": 0,
        "discountRate": 0,
        "discountPrice": 0,
        "itemUrl": "http://books.rakuten.co.jp/rb/898594/",
        "affiliateUrl": "http://hb.afl.rakuten.co.jp/hgc/g00q0725.ndddq638.g00q0725.ndddr86e/?pc=http%3A%2F%2Fbooks.rakuten.co.jp%2Frb%2F898594%2F&m=http%3A%2F%2Fm.rakuten.co.jp%2Frms%2Fmsv%2FItem%3Fn%3D898594%26surl%3Dbook",
        "smallImageUrl": "http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8205/82054281.jpg?_ex=64x64",
        "mediumImageUrl": "http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8205/82054281.jpg?_ex=120x120",
        "largeImageUrl": "http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8205/82054281.jpg?_ex=200x200",
        "chirayomiUrl": "",
        "availability": "1",
        "postageFlag": 1,
        "limitedFlag": 0,
        "reviewCount": 1,
        "reviewAverage": "5.0",
        "booksGenreId": "001009001004"
      }
    }
  ],
  "GenreInformation": []
}
EOS
    uri_template = Addressable::Template.new "https://app.rakuten.co.jp/services/api/BooksBook/Search/20130522{?affiliateId,applicationId,author,page}"
    stub_request(:get, uri_template).
      to_return(:status => 200, :body => response, :headers => {})
  end
end
