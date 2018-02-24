def json(url)
  response = RestClient.get(url)
  data = JSON.parse(response.body)
end

def purchase_json_helper
  data = json('https://private-anon-fb756654dd-driftrockdevtest.apiary-mock.com/purchases')
  data['data'].each do |hash|
    return true if hash["item"] == "Some purchaseable item"
  end
end
