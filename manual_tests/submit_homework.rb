require 'rest-client'
require 'mail'
require 'socket'

is_fernando = Socket.gethostname == 'fernando-dell' 

mail = Mail.new do 
    from "zalgo@zalgo.com"
    to is_fernando ? "submit+homework1@homeworkio.com" : 
    	"submit+homework10@homeworkio.com"
    subject "testing this out"
    body "Oh hai teacher"
    add_file is_fernando ? 
    	"/home/fernando/Proyectos/Rails/homeworkio/manual_tests/imagine.txt" : 
    	"/home/lfborjas/workspace/homeworkio/manual_tests/imagine.txt"
end


RestClient.post "http://localhost:3000/incoming_mime",  "body-mime" => mail.to_s
