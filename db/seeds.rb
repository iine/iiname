# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Prefecture.create([{prefecture: '北海道'},
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
				   {prefecture: '沖縄県'}])

Suggestion.destroy_all
	Iiname::Engine.new(mode: :hot_trend).fetch.each do | keyword |
	Suggestion.where(keyword: keyword).first_or_create
end
