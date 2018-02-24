describe 'Testing user class' do
  before(:each) do
    @user = User.new
  end

  it "users api requests to respond with status 200" do
    expect(@user.user_api_request(1,1).code).to eq(200)
  end

  it "json_parse to return parsed object" do
    expect(@user.json_parse(rest_client_response_helper)).to eq(expected_response_helper)
  end

  it "must return correct user with given key and value" do
    @user.json_parse(@user.user_api_request(1,20))
    expect(@user.find_user("id","ZZLB-4HCN-OA3N-LGWB")).to eq(user_lakin)
  end

end
