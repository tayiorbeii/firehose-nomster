# json.array! @places do |place|
#   json.name place.name
#   json.address place.address
#   json.added_by place.user.email
# end

json.array! @places, :name, :address

