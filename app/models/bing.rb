require 'net/http'
require 'uri'
require 'json'

class Bing
  attr_accessor :name

  def initialize(value)
    @name = 'bing'
    @value = value
  end

  def search
    uri = 'https://api.cognitive.microsoft.com'
    path = '/bing/v7.0/search'

    begin
      uri = URI(uri + path + '?q=' + @value)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Ocp-Apim-Subscription-Key'] = ENV['BING_API_KEY']
      response = http.request(request)
    rescue StandardError => e
      print e
    end

    JSON.parse(response.body)
  end
end
