# -*- coding: utf-8 -*-
module GoogleBookSearchHelper
  def create_google_book_search_stub(title="長嶋茂雄")
    stub_response = <<"EOJSON"
{
  "responseData": {
    "cursor": {
      "moreResultsUrl": "http://books.google.com/books?source=uds&start=0&hl=en&q=%E9%95%B7%E5%B6%8B%E8%8C%82%E9%9B%84",
      "currentPageIndex": 0,
      "estimatedResultCount": "1",
      "pages": [
        {
          "label": 1,
          "start": "0"
        }
      ]
    },
    "Results": [
      {
        "pageCount": "1",
        "tbWidth": "60",
        "tbHeight": "80",
        "tbUrl": "http://books.google.com/books/content?id=uG14CgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl",
        "GsearchResultClass": "GbookSearch",
        "unescapedUrl": "http://books.google.com/books?id=uG14CgAAQBAJ&pg=RA3-PA57&dq=%E9%95%B7%E5%B6%8B%E8%8C%82%E9%9B%84&num=8&client=internal-uds&cd=1&source=uds",
        "url": "http://books.google.com/books%3Fid%3DuG14CgAAQBAJ%26pg%3DRA3-PA57%26dq%3D%25E9%2595%25B7%25E5%25B6%258B%25E8%258C%2582%25E9%259B%2584%26num%3D8%26client%3Dinternal-uds%26cd%3D1%26source%3duds",
        "title": "［完全版］長嶋茂雄大事典",
        "titleNoFormatting": "［完全版］長嶋茂雄大事典",
        "authors": "石塚紀久雄",
        "bookId": "unknown",
        "publishedYear": "1993"
      }
    ]
  },
  "responseStatus": 200,
  "responseDetails": null
}
EOJSON
    uri_template = Addressable::Template.new "http://www.google.com/uds/GbookSearch{?hl,key,supplied,q,rsz,start,v}"
    stub_request(:get, uri_template).to_return({:body => stub_response})
  end
end
