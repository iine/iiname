json.array!(@statuses) do |status|
  json.extract! status, :id, :keyword
  json.url status_url(status, format: :json)
end
