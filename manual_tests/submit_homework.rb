require 'rest-client'
require 'mail'

mail = Mail.new do 
    from "zalgo@zalgo.com"
    to "8193977fa86911b60fe2+homework10@cloudmailin.net"
    subject "testing this out"
    body "Oh hai teacher"
    add_file "/home/lfborjas/workspace/homeworkio/manual_tests/imagine.txt"
end


RestClient.post "http://localhost:3000/incoming", :message => mail.to_s
