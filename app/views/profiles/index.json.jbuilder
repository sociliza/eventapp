json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :gender, :date_of_birth, :contact_number, :image
  json.url profile_url(profile, format: :json)
end
