module TurboSMS
  @default_options = {:wsdl => 'http://turbosms.in.ua/api/wsdl.html'}
  class << self; attr_accessor :default_options; end
end