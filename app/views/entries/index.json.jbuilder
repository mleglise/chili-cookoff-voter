json.array!(@entries) do |entry|
  json.extract! entry, :id, :name, :owner_id, :event_id, :category_id, :has_meat, :spice_level, :ingredients, :description
  json.url entry_url(entry, format: :json)
end
