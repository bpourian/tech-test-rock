require 'rest-client'
require 'json'

class User
attr_reader :user_data, :parsed_data

  def url(page, per_page)
    url = "https://driftrock-dev-test.herokuapp.com/users?page=#{page}&per_page=#{per_page}"
  end

  def user_api_request(page, per_page)
    @user_data = RestClient.get(url(page, per_page))
  end

  def json_parse(user_data)
    @parsed_data = JSON.parse(user_data)
  end

  def find_user(key,value)
    @parsed_data['data'].each do |user_info|
      return user_info if user_info[key] == value
    end
  end

end
