$:.push File.expand_path('../lib', __FILE__)
require 'turbosms/version'

Gem::Specification.new do |s|
  s.name        = 'turbosms'
  s.version     = TurboSMS::VERSION
  s.date        = Date.today.to_s
  s.summary     = 'TurboSMS'
  s.description = "Ruby gem implements TurboSMS soap gateway http://turbosms.ua"
  s.authors     = ["Vitalik Danchenko"]
  s.email       = 'vitalik.danchenko@gmail.com'
  s.homepage    = 'https://github.com/vitalikdanchenko/turbosms'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")

  s.add_runtime_dependency 'savon', '~> 2.12', '>= 2.12.0'
end
