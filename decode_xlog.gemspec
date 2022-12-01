# frozen_string_literal: true

require_relative "lib/decode_xlog/version"

Gem::Specification.new do |spec|
  spec.name = "decode_xlog"
  spec.version = DecodeXlog::VERSION
  spec.authors = ["华惠友"]
  spec.email = ["huiyou.hua@2339.com"]

  spec.summary = "Write a short summary, because RubyGems requires one."
  spec.description = "Write a longer description or delete this line."
  spec.homepage = "https://github.com/decode_xlog"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  #依赖的文件
  spec.files = Dir["lib/**/*.rb"] + %w{ bin/decode_xlog README.md}
  #可执行文件
  spec.executables   =%w{decode_xlog}
  #导入的路径
  spec.require_paths = %w{lib}

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "uri"
  spec.add_development_dependency "net-http"
end
