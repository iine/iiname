json.array!(@images) do |image|
  json.extract! image, :id, :url, :keyword
end
