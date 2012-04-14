class Submission < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :student
  belongs_to :homework

  def on_time? 
    created_at <= homework.deadline
  end

  def upload_to_dropbox(attachment)
    folder_path = "/#{homework.id.to_s}_#{homework.title}/#{student.email.gsub('@', '_at_')}"
    db_session = homework.teacher.db_session
    #
    #Create folder
    db_session.create_folder folder_path

    #Upload to dropbox
    db_session.upload("#{folder_path}/#{attachment.filename}", attachment.body.decoded)
  end
end
