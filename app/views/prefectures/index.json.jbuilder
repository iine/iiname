json.array!(@prefectures) do |prefecture|
  json.extract! prefecture, :id, :prefecture, :prefecture_id
  json.url prefecture_url(prefecture, format: :json)
end
