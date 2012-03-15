class Submission < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
end
