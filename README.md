turbosms
========

Ruby gem implements TurboSMS soap gateway http://turbosms.ua

------------------------------------------------------------------------------
Usage
------------------------------------------------------------------------------
You should have registered account at http://turbosms.ua/

    gem install turbosms
    
    require 'turbosms'
    
    TurboSMS.default_options[:login]    = 'login'
    TurboSMS.default_options[:password] = 'password'
    TurboSMS.default_options[:sender]   = 'sender'    # should be approved by administrator and no larger than 11 characters
    
    TurboSMS.send_sms '+380998765432', 'test message'
  

