# -*- coding: utf-8 -*-
module GoogleBookSearchHelper
  def create_google_book_search_stub(title="長嶋茂雄")
    stub_response = <<"EOJSON"
{
  "responseData": {
    "results": [
      {
        "GsearchResultClass": "GbookSearch",
        "unescapedUrl": "http://books.google.com/books?id=uG14CgAAQBAJ&pg=RA3-PA57&dq=#{title}&num=8&client=internal-uds&cd=1&source=uds",
        "url": "http://books.google.com/books%3Fid%3DuG14CgAAQBAJ%26pg%3DRA3-PA57%26dq%3D#{title}%26num%3D8%26client%3Dinternal-uds%26cd%3D1%26source%3duds",
        "title": "［完全版］長嶋茂雄大事典",
        "titleNoFormatting": "［完全版］長嶋茂雄大事典",
        "authors": "石塚紀久雄",
        "bookId": "unknown",
        "publishedYear": "1993",
        "tbUrl": "http://books.google.com/books/content?id=uG14CgAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl",
        "tbHeight": "80",
        "tbWidth": "60",
        "pageCount": "1"
      }
    ],
    "cursor": {
      "pages": [
        {
          "start": "0",
          "label": 1
        }
      ],
      "estimatedResultCount": "1129",
      "currentPageIndex": 0,
      "moreResultsUrl": "http://books.google.com/books?source=uds&start=0&hl=en&q=#{title}"
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
      "moreResultsUrl": "http://books.google.com/books?source=uds&start=0&hl=en&q=#{title}",
      "searchResultTime": "0.31"
    }
  },
  "responseDetails": null,
  "responseStatus": 400
}
EOJSON
    uri_template = Addressable::Template.new "http://www.google.com/uds/GbookSearch{?hl,key,supplied,q,rsz,start,v}"
    stub_request(:get, uri_template).to_return({:body => stub_response}, {:body => end_response})
  end
end
