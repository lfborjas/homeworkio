class Submission < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  belongs_to :student
  belongs_to :homework

  def on_time? 
    created_at <= homework.deadline
  end
end
