json.array!(@events) do |event|
  json.extract! event, :id, :business_id, :title, :start_date, :end_date, :location, :agenda, :address
  json.url event_url(event, format: :json)
end
