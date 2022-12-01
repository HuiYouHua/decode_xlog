# frozen_string_literal: true


require_relative "decode_xlog/version"
require 'uri'
require 'net/http'

module DecodeXlog
  class Decode
    def self.decode(file_path)

      url = URI("http://192.168.11.61:8080/decode")
      # 这边修改了端口号  nginx 进行了端口转发
      # url = URI("http://192.168.11.61:8080/decode/")

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
