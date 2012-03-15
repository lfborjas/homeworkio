class IncomingController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    s = Submission.new
    message = Mail.new(params[:message])
    s.message = message.body.decoded
    s.attachment = message.attachments.first
    s.save

    render text: "success", status: 200
  end
end
