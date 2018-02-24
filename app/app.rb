require 'rest-client'
require 'json'



# response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/status'
#
# puts response



@response2 = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/users?page=1&per_page=100'
# puts response2
# url = 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/purchases?page=1&per_page=10'

# response3 = RestClient.get url
# data = JSON.parse(response3.body)
#
# p data["data"][1]["item"]

@parsed_data = ''


def json_parse(user_data)
  @parsed_data = JSON.parse(user_data)
end

def find_user(key,value)
  @parsed_data['data'].each do |user_info|
    puts "Name: #{user_info["first_name"]} #{user_info["last_name"]}" if user_info[key] == value
  end

end



json_parse(@response2)
find_user("email", "jack_lakin@rodriguezschuppe.io")


# data = JSON.parse(response2.body)
# data2 = JSON.parse(response3.body)
# data.each do |child|
#     puts child[1]
#
# end

# data['data'].each do |child|
#     child.each do |k,v|
#       puts k
#
#     end
# end

# data2['data'].each do |child|
#     child.each do |k,v|
#       puts v if k == 'item'
#
#     end
# end




# {"data":[{"id":"KZHR-1H35-2IH8-JXYN","first_name":"Quincy","last_name":"Schimmel",
#   "phone":"186.301.6921 x948","email":"schimmel_quincy@ernser.io"}]}
#
#
#
#
#
# {"data":[{"user_id":"2K7H-A8SQ-6R5V-8OT5","item":"Enormous Linen Plate","spend":"87.16"}]}
#
# {
#   "error_message": "per_page cannot be greater than 100"
# }
