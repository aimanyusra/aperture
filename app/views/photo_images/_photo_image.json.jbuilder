json.extract! photo_image, :id, :created_at, :updated_at
json.url photo_image_url(photo_image, format: :json)
