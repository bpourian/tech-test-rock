def json(url)
  response = RestClient.get(url)
  data = JSON.parse(response.body)
end

def purchases_rest_client_response_helper
  response = RestClient.get('https://private-anon-fb756654dd-driftrockdevtest.apiary-mock.com/purchases?page=1&per_page=20')
end

def purchase_json_helper
  data = json('https://private-anon-fb756654dd-driftrockdevtest.apiary-mock.com/purchases')
  data['data'].each do |hash|
    return true if hash["item"] == "Some purchaseable item"
  end
end

def expected_purchases_response_helper
  {"data"=>[
    {
      "user_id"=>"12DF-2324-GA2D-31RT",
      "item"=>"Some purchaseable item",
      "spend"=>"19.99"
      }
      ]
    }
end
