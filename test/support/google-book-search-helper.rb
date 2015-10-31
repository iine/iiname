# -*- coding: utf-8 -*-
module GoogleBookSearchHelper
  # todo google-search-help.rbにまとめる。メソッド名は変える。
  def create_search_stab(title="長嶋茂雄")
    stub_request(:get, "http://www.google.com/uds/GwebSearch?filter=1&hl=ja&key=notsupplied&q=MyTextOne&rsz=large&start=0&v=1.0").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
  end
end
