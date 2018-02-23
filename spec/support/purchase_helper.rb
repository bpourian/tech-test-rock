def purchase_json_helper
  response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-mock.com/purchases'
  data = JSON.parse(response.body)
  result = false

  data['data'].each do |hash|
      hash.each do |k,v|
          result = true if hash[k] == "Some purchaseable item"
      end
  end
  result
end
