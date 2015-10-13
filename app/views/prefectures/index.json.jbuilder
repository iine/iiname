json.array!(@prefectures) do |prefecture|
  json.extract! prefecture, :id, :prefecture, :prefecture_id
end
