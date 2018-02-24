class Purchases
attr_reader :purchases_data, :parsed_data

  def url(page, per_page)
    url = "https://driftrock-dev-test.herokuapp.com/purchases?page=#{page}&per_page=#{per_page}"
  end

  def purchases_api_request(page, per_page)
    @purchases_data = RestClient.get(url(page, per_page))
  end

  def json_parse(purchase_data)
    @parsed_data = JSON.parse(purchase_data)
  end

  def find_purchases_total(key,value)
    total = 0.00
    @parsed_data['data'].each do |purchase_info|
      return total += purchase_info["spend"].to_f if purchase_info[key] == value
    end
  end

end
