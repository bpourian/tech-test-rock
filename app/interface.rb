require_relative 'user'
require_relative 'purchases'

class Interface
  def initialize(user_class = User.new, purchase_class = Purchases.new)
    @user_class = user_class
    @purchase_class = purchase_class
  end

  def find_user_id(key="email", value)
    @user_class.load_each_page_and_make_query(key, value)
  end

  def total_spent_by_user(key="user_id", value)
    @purchase_class.load_each_page_and_make_query_total_spend(key, value)
  end
end
