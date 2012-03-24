require 'rest-client'
require 'mail'

path = "/home/lfborjas/workspace/homeworkio/" 
mail = Mail.new do 
    from "zalgo@zalgo.com"
    to "submit+homework5@homeworkio.com"
    subject "testing this out"
    body "Oh hai teacher"
    add_file "#{path}manual_tests/imagine.txt"
end


File.open("#{path}manual_tests/test.eml", 'w'){|f| f.write(mail.to_s)}

`cat #{path}manual_tests/test.eml | #{path}script/mailman_server `
