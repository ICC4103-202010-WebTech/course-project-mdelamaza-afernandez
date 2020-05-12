json.extract! event, :id, :name, :description,:voted_date, :created_at, :updated_at
json.url event_url(event, format: :json)
