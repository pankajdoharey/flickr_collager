module ::AppConfig::FlickrSearch
  def self.set_options config
    config["flickr"].each do |key, val|
      self.const_set(key, val)
    end
  end

  def search_and_save_flickr_image(text)
    uri = URI(search_flickr_for text)

    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      filepath = File.join(TEMP_DIR, File.basename(uri.path))
      open(filepath , "wb") do |file|
        file.write http.get(uri).read_body
        file.close
      end
    end
  end

  def search_flickr_for(search_term)
    response_body = build_query_for(search_term).read_body
    response_data = response_body.to_s.match(/\[([^\}]+)\}/)[0]
                    .sub(/^\[/, '')
    json_response = JSON.parse response_data
    construct_image_url_from json_response
  end

  def get_image_list
    Dir[TEMP_DIR << "/*"]
  end

  private

  def build_query_for(word)
    uri = get_uri_for word

    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      http.request request
    end
  end

  def get_uri_for search_text
    URI(
      uri_builder(
        API_URL, {
          format: API_FORMAT, sort: API_SORT,
          method: API_METHOD, text: search_text,
          tag_mode: :all, api_key: API_KEY
        }
      )
    )
  end

  def uri_builder(url, params={})
    url + params.each_pair.map{|k,v| "#{k}=#{v}"}.join("&")
  end

  def construct_image_url_from json
    "https://farm#{json["farm"]}.staticflickr.com/#{json["server"]}/#{json["id"]}_#{json["secret"]}.jpg"
  end
end
