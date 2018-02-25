class Purchases
attr_reader :purchases_data, :parsed_data, :url,

  def initialize
    @sorted_array = []
  end

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
      total += purchase_info["spend"].to_f if purchase_info[key] == value
    end
    total
  end

  def load_each_page_and_make_query_total_spend(key="user_id", value)
    total_spent_by_user = 0
    page_number = 1
    while purchases_api_request(page_number, 100).headers[:content_length].to_i > 12 do
      json_parse(purchases_api_request(page_number, 100))
      total_spent_by_user += find_purchases_total(key, value)
      page_number += 1
    end
    total_spent_by_user.round(2)
  end

  def create_comparison_list
    list
  end

  def filter_and_add_to_comparison_list(key)
    p 'inside method'
      @parsed_data['data'].each do |purchase_info|

        purchase_info.each do |k,v|
        if @sorted_array == nil
            new_hash = {purchase_info[key] => 1}
            @sorted_array = [new_hash]

          elsif k == key && @sorted_array != nil
  
            @sorted_array.each do |item|

              if item.has_key?(v)

                array_index = @sorted_array.index {|h| h[v] }
                @sorted_array[array_index][v] += 1

                else

                  new_hash = {purchase_info[key] => 1}
                  @sorted_array.push(new_hash)

              end
            end
        end
      end
    end
    p 'arryay  ====='
    p @sorted_array
  end

  def filter_total_spent_by(key)
    total_spent_by_user = 0
    page_number = 1

    while purchases_api_request(page_number, 100).headers[:content_length].to_i > 12 do
      json_parse(purchases_api_request(page_number, 100))
      filter_and_add_to_comparison_list(key)
      page_number += 1
    end

  end

end
