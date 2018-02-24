describe 'Testing purchases class' do
  before(:each) do
    @purchases = Purchases.new
  end

  it "purchases api requests to respond with status 200" do
    expect(@purchases.purchases_api_request(1,1).code).to eq(200)
  end

  it "json_parse to return parsed object" do
    expect(@purchases.json_parse(purchases_rest_client_response_helper)).to eq(expected_purchases_response_helper)
  end

  it "must return correct sum of purchases for user" do
    mock_server = purchases_rest_client_response_helper

    @purchases.json_parse(mock_server)

    expect(@purchases.find_purchases_total("user_id","12DF-2324-GA2D-31RT")).to eq(19.99)
  end

end
