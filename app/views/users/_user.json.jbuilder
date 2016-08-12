json.extract! user, :id, :name, :nick_name, :image_id, :created_at, :updated_at
json.url user_url(user, format: :json)