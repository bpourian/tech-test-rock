describe "Testing api" do

  it "api status to be OK " do
    response = RestClient.get 'https://private-anon-fb756654dd-driftrockdevtest.apiary-proxy.com/status'
    json = JSON.parse(response.body)
    expect(json).to eq({"status"=>"ok"})
  end
end
