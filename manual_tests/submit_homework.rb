require 'rest-client'
require 'mail'
require 'socket'

is_fernando = Socket.gethostname == 'fernando-dell' 

mail = Mail.new do 
    from ARGV[0] || "zalgo@zalgo.com"
    to ARGV[1] || "submit+homework1@homeworkio.com"
    subject "testing this out"
    body "Oh hai teacher"
    add_file "#{Dir.pwd}/manual_tests/imagine.txt"
end


RestClient.post "http://#{is_fernando ? "localhost:3000" : "homeworkio.dev"}/incoming_mime",  "body-mime" => mail.to_s
