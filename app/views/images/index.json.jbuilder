json.array!(@images) do |image|
  json.extract! image, :id, :title, :user_id, :file
  json.url image_url(image, format: :json)
end
