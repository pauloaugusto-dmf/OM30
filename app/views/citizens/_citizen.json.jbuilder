json.extract! citizen, :id, :status, :first_name, :last_name, :cpf, :cns, :email, :date_of_birth, :telephone, :photo,
              :created_at, :updated_at
json.url citizen_url(citizen, format: :json)
json.photo do
  json.array!(citizen.photo) do |photo|
    json.id photo.id
    json.url url_for(photo)
  end
end
