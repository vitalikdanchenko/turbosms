module TurboSMS
  class << self
    def balance
      authorize unless authorized?
      authorised_call(:get_credit_balance).to_f
    end

    def get_message_status(message_id)
      authorize unless authorized?
      message = { 'MessageId' => message_id }
      authorised_call(:get_message_status, message: message)
    end

    def send_sms(destination, text = nil, sender = nil)
      authorize unless authorized?
      message = {
        sender:       sender || default_options[:sender],
        destination:  destination,
        text:         text
      }
      result = authorised_call(:send_sms, message: message)
      raise SendingSMSError, result unless result.instance_of?(Array)
      result[1] # message id
    end
  end
end
