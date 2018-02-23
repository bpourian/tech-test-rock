require 'rest-client'

# driftrock = open('https://driftrock-dev-test.herokuapp.com/status')
# response_status = driftrock.status
# response_body = driftrock.read
#
# puts response_status
# puts response_body

response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/status'

puts response



response2 = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/users?page=&per_page='
puts response2

puts response2.read
