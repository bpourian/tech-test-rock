def json(url)
  response = RestClient.get(url)
  data = JSON.parse(response.body)
end

def user_rest_client_response_helper
  response = RestClient.get('https://private-anon-fb756654dd-driftrockdevtest.apiary-mock.com/users')
end


def user_json_helper
  data = json('https://private-anon-fb756654dd-driftrockdevtest.apiary-mock.com/users')

  data['data'].each do |hash|
    return true if hash["first_name"] == "Drift"
  end
end


def expected_user_response_helper
  {"data"=>[
    {
      "id"=>"12DF-2324-GA2D-31RT",
      "first_name"=>"Drift",
      "last_name"=>"Rock",
      "phone"=>"0-000-000-0000",
      "email"=>"drift.rock@email.com"
      }
      ]
    }
end

def user_drift
  [
    {
      "id"=>"12DF-2324-GA2D-31RT",
      "first_name"=>"Drift",
      "last_name"=>"Rock",
      "phone"=>"0-000-000-0000",
      "email"=>"drift.rock@email.com"
      }
    ]

end
