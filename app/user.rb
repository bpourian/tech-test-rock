require 'rest-client'
require 'json'

class User
attr_reader :user_data, :parsed_data, :user_found

  def initialize
    @user_found = ''
  end

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
      @user_found = user_info if user_info[key] == value
    end
  end

  def load_each_page_and_make_query(key="email", value)
    page_number = 1
    while user_api_request(page_number, 100).headers[:content_length].to_i > 12 do
      json_parse(user_api_request(page_number, 100))
      find_user(key, value)
      break if !user_found.empty?
      page_number += 1
    end
    @user_found["id"]
  end

end
