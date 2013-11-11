json.array!(@events) do |event|
  json.extract! event, :title, :description, :event_date, :polls_open, :polls_close, :owner_id
  json.url event_url(event, format: :json)
end
