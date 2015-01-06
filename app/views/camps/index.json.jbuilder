json.array!(@camps) do |camp|
  json.extract! camp, :id, :name, :address, :phone, :website
  json.url camp_url(camp, format: :json)
end
