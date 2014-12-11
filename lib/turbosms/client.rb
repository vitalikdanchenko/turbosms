require 'savon'

module TurboSMS
  class << self
    
    private
    
    def client
      @client ||= Savon.client(wsdl: default_options[:wsdl], log: false)
    end
    
    def authorized?
      !@cookies.nil?
    end
    
    def auth_message
      keys = [:login, :password]
      default_options.select{|key,_| keys.include? key}
    end
    
    def authorize
      response  = client.call(:auth, message: auth_message)
      result    = response.body[:auth_response][:auth_result]
      @cookies = response.http.cookies if (result.length == 27) # Ridiculous # Вы успешно авторизировались
      raise AuthError, result unless authorized?
    end
    
    def authorised_call(method_name, args = {})
      response_key  = "#{method_name}_response".to_sym
      result_key    = "#{method_name}_result".to_sym
      response = client.call(method_name, args.merge(cookies: @cookies))
      result = response.body[response_key][result_key]
      result = result[:result_array] if result.instance_of?(Hash) and !result[:result_array].nil?
      @cookies = nil if !result.instance_of?(Array) and result.length == 20 # Ridiculous # Вы не авторизированы
      result
    end
    
  end
end