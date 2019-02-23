json.extract! event, :id, :date, :variety, :parcel, :action, :details, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
