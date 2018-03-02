json.extract! contact, :id, :name, :email, :address, :city, :state, :zip, :phone, :category, :remarks, :created_at, :updated_at
json.url contact_url(contact, format: :json)
