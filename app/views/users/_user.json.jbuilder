json.extract! user, :id, :name, :email, :phone, :snapchat, :facebook, :linkedin, :instagram, :twitter, :created_at, :updated_at
json.url user_url(user, format: :json)
