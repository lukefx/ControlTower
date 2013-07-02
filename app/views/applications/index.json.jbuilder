json.array!(@applications) do |application|
  json.extract! application, :name, :description
  json.url application_url(application, format: :json)
end
