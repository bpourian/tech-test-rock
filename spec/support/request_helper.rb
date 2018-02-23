def status_helper
  response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/status'
  JSON.parse(response.body)
end

def user_info_helper
  response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-mock.com/users'
  data = JSON.parse(response.body)
  result = false
  data['data'].each do |item|
      item.each do |k,v|
          result = true if item[k] == "Drift"
      end
  end
  result
end
