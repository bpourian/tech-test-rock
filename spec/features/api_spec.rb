describe "Testing api" do
  it "api status to be OK " do
    expect(status_helper).to eq({"status"=>"ok"})
  end

  it "user json file to be returned" do
    expect(user_info_helper).to be(true)
  end
end
