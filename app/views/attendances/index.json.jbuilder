json.array!(@attendances) do |attendance|
  json.extract! attendance, :user_id, :event_id, :guest_type, :approved_at
  json.url attendance_url(attendance, format: :json)
end
