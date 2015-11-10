# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
	{prefecture: '北海道'},
	{prefecture: '青森県'},
	{prefecture: '岩手県'},
	{prefecture: '宮城県'},
	{prefecture: '秋田県'},
	{prefecture: '山形県'},
	{prefecture: '福島県'},
	{prefecture: '茨城県'},
	{prefecture: '栃木県'},
	{prefecture: '群馬県'},
	{prefecture: '埼玉県'},
	{prefecture: '千葉県'},
	{prefecture: '東京都'},
	{prefecture: '神奈川県'},
	{prefecture: '新潟県'},
	{prefecture: '富山県'},
	{prefecture: '石川県'},
	{prefecture: '福井県'},
	{prefecture: '山梨県'},
	{prefecture: '長野県'},
	{prefecture: '岐阜県'},
	{prefecture: '静岡県'},
	{prefecture: '愛知県'},
	{prefecture: '三重県'},
	{prefecture: '滋賀県'},
	{prefecture: '京都府'},
	{prefecture: '大阪府'},
	{prefecture: '兵庫県'},
	{prefecture: '奈良県'},
	{prefecture: '和歌山県'},
	{prefecture: '鳥取県'},
	{prefecture: '島根県'},
	{prefecture: '岡山県'},
	{prefecture: '広島県'},
	{prefecture: '山口県'},
	{prefecture: '徳島県'},
	{prefecture: '香川県'},
	{prefecture: '愛媛県'},
	{prefecture: '高知県'},
	{prefecture: '福岡県'},
	{prefecture: '佐賀県'},
	{prefecture: '長崎県'},
	{prefecture: '熊本県'},
	{prefecture: '大分県'},
	{prefecture: '宮城県'},
	{prefecture: '鹿児島県'},
	{prefecture: '沖縄県'}
	].each do | pref |
		Prefecture.where(pref).first_or_create
	end

Iiname::Engine.new(mode: :hot_trend).fetch.each do | keyword |
	Suggestion.where(keyword: keyword).first_or_create
end


[
(:url => "https://www.pakutaso.com/assets_c/2015/06/PAK85_syokutakubkaraage20150203185651-thumb-1000xauto-18083.jpg", :keyword => "唐揚げ")
(:url => "https://www.pakutaso.com/assets_c/2015/09/SAWA_hanbagu-thumb-1000xauto-19147.jpg", :keyword => "ハンバーグ")
(:url => "https://www.pakutaso.com/assets_c/2015/09/0I9A148215080803moyai-thumb-1000xauto-19293.jpg", :keyword => "モヤイ")
(:url => "https://www.pakutaso.com/assets_c/2015/06/OOK3S0420140125180412-thumb-1000xauto-18264.jpg", :keyword => "社畜")
(:url => "https://www.pakutaso.com/assets_c/2015/09/PAK85_zaru15190938-thumb-1000xauto-19175.jpg", :keyword => "ざる")
(:url => "https://farm6.staticflickr.com/5592/15028333166_5f7b680676_m.jpg", :keyword => "金")
(:url => "https://farm4.staticflickr.com/3881/15178390720_3cba74dc80_m.jpg", :keyword => "水泳")
(:url => "https://farm6.staticflickr.com/5215/5386698769_e21d40bcfe_m.jpg", :keyword => "サッカー")
(:url => "https://farm9.staticflickr.com/8752/16505316703_265c1a34fd_m.jpg", :keyword => "野球")
(:url => "https://farm9.staticflickr.com/8325/8417364621_4d7b378b9b_m.jpg", :keyword => "バスケットボール")
(:url => "https://farm2.staticflickr.com/1009/1459269613_053f521a18_m.jpg", :keyword => "ネコ")
(:url => "https://farm6.staticflickr.com/5472/9386968830_91cfc48341_m.jpg", :keyword => "イヌ")
(:url => "https://farm7.staticflickr.com/6110/6891185432_f097c86388_m.jpg", :keyword => "タコ")
(:url => "https://farm9.staticflickr.com/8359/8287219528_78bbdb806f_m.jpg", :keyword => "イカ")
(:url => "https://farm2.staticflickr.com/1045/540280595_d6d2c55209_m.jpg", :keyword => "夜景")
(:url => "https://farm3.staticflickr.com/2636/3887295488_60a6bb4113_m.jpg", :keyword => "ビール")
(:url => "https://farm8.staticflickr.com/7233/7179981376_5ae987f568_m.jpg", :keyword => "エビチリ")
(:url => "https://farm7.staticflickr.com/6195/6088901491_7848621d74_m.jpg", :keyword => "ハリケーン")
(:url => "https://farm7.staticflickr.com/6175/6171699059_9468fbbd23_m.jpg", :keyword => "日本一")
(:url => "https://farm4.staticflickr.com/3955/14940761453_f528986b79_m.jpg", :keyword => "ハワイ")
(:url => "https://farm4.staticflickr.com/3168/3085007980_21a995c974_m.jpg", :keyword => "カラフル")
(:url => "https://farm4.staticflickr.com/3100/2693171833_3545fb852c_m.jpg", :keyword => "花火")
(:url => "https://farm4.staticflickr.com/3139/2895021060_55330cb1fb_m.jpg", :keyword => "サクラ")
(:url => "https://farm6.staticflickr.com/5655/21167854675_55e6c3b822_m.jpg", :keyword => "マネキン")
(:url => "https://farm8.staticflickr.com/7406/16543319711_af32a7f2af_m.jpg", :keyword => "考える人")
(:url => "https://farm1.staticflickr.com/117/260834071_d5f53af89d_m.jpg", :keyword => "温泉")
(:url => "https://farm3.staticflickr.com/2841/10678579184_62aff32a44_m.jpg", :keyword => "車")
(:url => "https://farm6.staticflickr.com/5142/5613410129_50bd4de94b_m.jpg", :keyword => "実験")
(:url => "https://farm1.staticflickr.com/174/382489491_8c70ca346b_m.jpg", :keyword => "フルーツ")
(:url => "https://farm3.staticflickr.com/2722/4159101220_527e168cb2_m.jpg", :keyword => "ライブ")
].each do |keyword|
  Image.where(url: url, keyword: keyword).first_or_create
end
