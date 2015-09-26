json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :keyword
  json.url suggestion_url(suggestion, format: :json)
end
