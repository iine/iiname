# -*- coding: utf-8 -*-
module RakutenSearchHelper
  def create_search_stub(title="長嶋茂雄")
    stub_request(:get, "https://app.rakuten.co.jp/services/api/BooksBook/Search/20130522?affiliateId=145c2ffe.da7cddf0.145c2fff.499f0ce4&applicationId=1014810301761510263&author=%E9%95%B7%E5%B6%8B%E8%8C%82%E9%9B%84").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'RakutenWebService SDK for Ruby-0.6.3'}).
      to_return(:status => 200, :body => "", :headers => {})
  end
end
