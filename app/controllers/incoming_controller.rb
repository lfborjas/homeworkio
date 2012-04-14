class IncomingController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    email = Mail.new(params["body-mime"])    
    homework = Homework.from_address(email.to.to_s)
    if homework
      #we have the homework, gotta get the student now
      s = homework.submissions.build 
      s.student = Student.from_address(email.from.first.to_s, homework)
      s.message = email.body.decoded
      
      #found at: 
      #<http://stackoverflow.com/questions/4357893/parsing-an-email-attachment-w-paperclip-possible-w-o-a-tempfile>
      attachment = email.attachments.first

      if attachment
        f = StringIO.new(attachment.body.decoded)
        f.class.class_eval do
          attr_accessor :original_filename, :content_type
        end
        f.original_filename = attachment.filename
        f.content_type = attachment.mime_type

        s.attachment = f
        if s.save
          s.delay.upload_to_dropbox( attachment )
          HomeworkMailer.submission_response( s ).deliver
        end

      else
        HomeworkMailer.submission_failure( s ).deliver
      end
      render text: "success", status: 200
    else
      render text: "invalid", status: 404
    end

  end
end
