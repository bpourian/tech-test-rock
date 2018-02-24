describe 'Testing user class' do
  before(:each) do
    @user = User.new
  end

  it "users api requests to respond with status 200" do
    expect(@user.user_api_request(1,1).code).to eq(200)
  end

  it "json_parse to return parsed object" do
    expect(@user.json_parse(user_rest_client_response_helper)).to eq(expected_user_response_helper)
  end

  it "must return correct user with given key and value" do
    mock_server = user_rest_client_response_helper
    @user.json_parse(mock_server)
    expect(@user.find_user("id","ZZLB-4HCN-OA3N-LGWB")).to eq(user_drift)
  end

  it "must go through all data and search using email to return user id" do
    expect(@user.load_each_page_and_make_query("daniel_cameron@bergstrom.io")).to eq("2WUC-KDH2-5LY0-HVCU")
  end

end
