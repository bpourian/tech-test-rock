describe "Testing interface class" do

  before(:each) do
    @interface = Interface.new
  end

  it "return total spent by user given email address" do
    user_id = @interface.find_user_id("shaniya_gutmann@metz.biz")
    expect(@interface.total_spent_by_user(user_id)).to eq(107.06)
  end
end
