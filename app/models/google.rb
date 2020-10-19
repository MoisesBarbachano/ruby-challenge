require 'net/http'
require 'uri'
require 'json'

class Google
  attr_accessor :name

  def initialize(value)
    @name = 'google'
    @value = value
  end

  def search
    uri = "https://customsearch.googleapis.com"
    path = "/customsearch/v1?cx=017576662512468239146%3Aomuauf_lfve"
    uri = URI.parse(uri + path + "&key=#{ENV['GOOGLE_API_KEY']}&q=#{@value}")

    begin
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
    rescue StandardError => e
      print e
    end

    JSON.parse(response.body)
  end
end
