require 'rest-client'
require 'mail'

mail = Mail.new do 
    from "zalgo@zalgo.com"
    to "submit+homework10@homeworkio.com"
    subject "testing this out"
    body "Oh hai teacher"
    add_file "/home/lfborjas/workspace/homeworkio/manual_tests/imagine.txt"
end


RestClient.post "http://localhost:3000/incoming_mime",  "mime-body" => mail.to_s
