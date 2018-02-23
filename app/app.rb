require 'rest-client'



response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/status'

puts response



# response2 = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/users?page=3&per_page=20'
# puts response2.body

response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/purchases?page=&per_page='
puts response
