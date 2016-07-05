json.array!(@businesses) do |business|
  json.extract! business, :id, :company_name, :slug
  json.url business_url(business, format: :json)
end
