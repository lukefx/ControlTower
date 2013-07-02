json.array!(@servers) do |server|
  json.extract! server, :name, :ip
  json.url server_url(server, format: :json)
end
