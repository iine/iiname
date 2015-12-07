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
{:url => "https://www.pakutaso.com/assets_c/2015/06/PAK85_syokutakubkaraage20150203185651-thumb-1000xauto-18083.jpg", :keyword => "から揚げ"},
{:url => "https://www.pakutaso.com/assets_c/2015/09/SAWA_hanbagu-thumb-1000xauto-19147.jpg", :keyword => "ハンバーグ"},
{:url => "https://www.pakutaso.com/assets_c/2015/09/0I9A148215080803moyai-thumb-1000xauto-19293.jpg", :keyword => "モヤイ"},
{:url => "https://www.pakutaso.com/assets_c/2015/09/PAK85_zaru15190938-thumb-1000xauto-19175.jpg", :keyword => "ざる"},
{:url => "https://farm6.staticflickr.com/5592/15028333166_5f7b680676_m.jpg", :keyword => "金"},
{:url => "https://farm4.staticflickr.com/3881/15178390720_3cba74dc80_m.jpg", :keyword => "水泳"},
{:url => "https://farm6.staticflickr.com/5215/5386698769_e21d40bcfe_m.jpg", :keyword => "サッカー"},
{:url => "https://farm9.staticflickr.com/8752/16505316703_265c1a34fd_m.jpg", :keyword => "野球"},
{:url => "https://farm9.staticflickr.com/8325/8417364621_4d7b378b9b_m.jpg", :keyword => "バスケットボール"},
{:url => "https://farm2.staticflickr.com/1009/1459269613_053f521a18_m.jpg", :keyword => "ネコ"},
{:url => "https://farm6.staticflickr.com/5472/9386968830_91cfc48341_m.jpg", :keyword => "イヌ"},
{:url => "https://farm7.staticflickr.com/6110/6891185432_f097c86388_m.jpg", :keyword => "タコ"},
{:url => "https://farm9.staticflickr.com/8359/8287219528_78bbdb806f_m.jpg", :keyword => "イカ"},
{:url => "https://farm2.staticflickr.com/1045/540280595_d6d2c55209_m.jpg", :keyword => "夜景"},
{:url => "https://farm3.staticflickr.com/2636/3887295488_60a6bb4113_m.jpg", :keyword => "ビール"},
{:url => "https://farm8.staticflickr.com/7233/7179981376_5ae987f568_m.jpg", :keyword => "エビチリ"},
{:url => "https://farm7.staticflickr.com/6195/6088901491_7848621d74_m.jpg", :keyword => "ハリケーン"},
{:url => "https://farm7.staticflickr.com/6175/6171699059_9468fbbd23_m.jpg", :keyword => "日本一"},
{:url => "https://farm4.staticflickr.com/3955/14940761453_f528986b79_m.jpg", :keyword => "ハワイ"},
{:url => "https://farm4.staticflickr.com/3168/3085007980_21a995c974_m.jpg", :keyword => "カラフル"},
{:url => "https://farm4.staticflickr.com/3100/2693171833_3545fb852c_m.jpg", :keyword => "花火"},
{:url => "https://farm4.staticflickr.com/3139/2895021060_55330cb1fb_m.jpg", :keyword => "サクラ"},
{:url => "https://farm6.staticflickr.com/5655/21167854675_55e6c3b822_m.jpg", :keyword => "マネキン"},
{:url => "https://farm8.staticflickr.com/7406/16543319711_af32a7f2af_m.jpg", :keyword => "考える人"},
{:url => "https://farm1.staticflickr.com/117/260834071_d5f53af89d_m.jpg", :keyword => "温泉"},
{:url => "https://farm3.staticflickr.com/2841/10678579184_62aff32a44_m.jpg", :keyword => "車"},
{:url => "https://farm6.staticflickr.com/5142/5613410129_50bd4de94b_m.jpg", :keyword => "実験"},
{:url => "https://farm1.staticflickr.com/174/382489491_8c70ca346b_m.jpg", :keyword => "フルーツ"},
{:url => "https://farm3.staticflickr.com/2722/4159101220_527e168cb2_m.jpg", :keyword => "ライブ"},
{:url => "http://3.bp.blogspot.com/-B6jCuurWcCM/VGX8dRq3ysI/AAAAAAAApHI/RkYk6WBqeHI/s800/curry_indian_man.png", :keyword => "インドの"},
{:url => "http://3.bp.blogspot.com/-1E_oghJXSG8/VcMlSPiZ8XI/AAAAAAAAwYs/z5M1depYh2E/s800/fujoshi_otaku.png", :keyword => "オタ"},
{:url => "http://3.bp.blogspot.com/-3enEXKDTuPA/Vffs6YrKjnI/AAAAAAAAx-0/zfIJZVrA6LM/s800/otaku_otagei.png", :keyword => "ライブ"},
{:url => "http://3.bp.blogspot.com/-SQs0ID0nGMg/U-8GiQYRrSI/AAAAAAAAk6c/eVsqqrP9Czo/s800/salaryman_money.png", :keyword => "社畜"},
{:url => "http://3.bp.blogspot.com/-ZWe9UUGMqDI/UylAX8vHpzI/AAAAAAAAeTE/ibSmOYMBp2A/s800/homeless_furousya.png", :keyword => "貧乏"},
{:url => "http://1.bp.blogspot.com/-t9nxrXcbNh8/UWvSyZ89rXI/AAAAAAAAQdo/ECkWs_9jKAY/s1600/rakugoka.png", :keyword => "師匠"},
{:url => "http://1.bp.blogspot.com/-yjkNaka5JAA/Vkcad8bYXyI/AAAAAAAA0cI/TKaFQvDXAVs/s800/doctor_run2.png", :keyword => "ジャンプ"},
{:url => "http://1.bp.blogspot.com/-ESgM6R9zv3c/U82z5IllMmI/AAAAAAAAjOI/ZjnZEdbJc4M/s800/job_keiji.png", :keyword => "逮捕"},
{:url => "http://2.bp.blogspot.com/-JPa0Nzk_E8M/Vf-aIH2jsyI/AAAAAAAAyDc/2FG8dSNSk-k/s800/computer_girl.png", :keyword => "プログラマー"},
{:url => "http://1.bp.blogspot.com/-T_ETm8C-jFc/VfS6Xrt7BdI/AAAAAAAAxPk/U6owJSWUGYo/s800/job_syokugyou_taiken_girl.png", :keyword => "ナースの"},
{:url => "http://2.bp.blogspot.com/-43uBGw3S6Rw/VRUS1UZoXuI/AAAAAAAAswo/72c1W5hvMzo/s800/movie_students.png", :keyword => "デート"},
{:url => "http://4.bp.blogspot.com/-SmXTKx3nBcA/UrlnHYwXxoI/AAAAAAAAcOA/erB3n3GC80E/s800/ramen_syouyu.png", :keyword => "ラーメン"},
{:url => "http://1.bp.blogspot.com/-JFpCpyCuI4E/VVGVY12lRqI/AAAAAAAAtk4/T0Nlkdo97FY/s800/food_hoshi_hijiki.png", :keyword => "ひじき"},
{:url => "http://2.bp.blogspot.com/-ReVIkFI9oiA/UnyFyC3eroI/AAAAAAAAaUI/O-xMMX0qnbA/s800/food_fukahire.png", :keyword => "中華"},
{:url => "http://4.bp.blogspot.com/-19-WZbihq14/VixB4sjiFjI/AAAAAAAA0GQ/v-5Iu2_sEqU/s800/food_pizza_takuhai.png", :keyword => "ピザ"},
{:url => "http://2.bp.blogspot.com/-Ioj6Qjlhx5o/VfS6PlEsfGI/AAAAAAAAxOo/LSZ849aIMXw/s800/food_yakibuta_cha-syu-.png", :keyword => "焼き豚"},
{:url => "http://1.bp.blogspot.com/-jvlnwXGDccQ/Ul5qT2yZePI/AAAAAAAAZDA/eQBc1jlCPo8/s800/nawatobi_girl.png", :keyword => "運動"},
{:url => "http://4.bp.blogspot.com/-xtKVi1ixiww/VEn-IaNl9qI/AAAAAAAAoo8/UufbC1hqW60/s800/sports_man.png", :keyword => "アスリートの"},
{:url => "http://4.bp.blogspot.com/-mtkfMVl0LtQ/UchCCS-swhI/AAAAAAAAVI4/OOhYOvFuTSQ/s800/food_tsukemen.png", :keyword => "つけ麺"}
].each do |keyword|
  Image.where(keyword).first_or_create
end
