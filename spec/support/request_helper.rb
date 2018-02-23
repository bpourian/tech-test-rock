def status_helper
  response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/status'
  JSON.parse(response.body)
end
