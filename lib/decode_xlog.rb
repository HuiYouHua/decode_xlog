# frozen_string_literal: true


require_relative "decode_xlog/version"
require 'uri'
require 'net/http'

# require 'httparty'

module DecodeXlog
  class Decode
    def self.decode(file_path)

      # url = "http://ios-decode.xing-ai.net/decode"
      # headers = {'Content-Type': 'multipart/form-data'}
      # HTTParty.post(url, headers: headers)


      url = URI.parse("http://ios-decode.xing-ai.net/decode")
      # 这边修改了端口号  nginx 进行了端口转发
      # url = URI("http://192.168.30.221:8999/decode")

      http = Net::HTTP.new(url.host, url.port);
      request = Net::HTTP::Post.new(url)
      form_data = [['file', File.open(file_path)]]
      request.set_form form_data, 'multipart/form-data'
      response = http.request(request)
      data = response.read_body

      to_file_path = file_path + '.log'
      file = File.new to_file_path, 'w+'
      file.binmode
      file << data
      file.flush
      file.close

      puts file.path

    end
  end
end
