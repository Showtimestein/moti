json.extract! reminder, :id, :goal, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)