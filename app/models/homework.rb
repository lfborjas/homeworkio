class Homework < ActiveRecord::Base
  belongs_to :list
  has_many :submissions

  def status
    submission_emails = submissions.map(&:email)
    if submissions.empty?
      :none
    elsif list.students.map(&:email).all?{|email| submission_emails.include?(email)  }
      :all
    else
      :some
    end
  end

  def email
    "8193977fa86911b60fe2+homework#{self.to_param}@cloudmailin.net"
  end
end
