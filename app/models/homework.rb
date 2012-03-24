class Homework < ActiveRecord::Base
  belongs_to :list
  has_many :submissions

  after_create do |homework|
    if homework.should_deliver
      HomeworkMailer.homework_notification(homework).deliver
    end
  end

  def status
    submission_emails = submissions.map{|s| s.student.email}
    if submissions.empty?
      :none
    elsif list.students.map(&:email).all?{|email| submission_emails.include?(email)  }
      :all
    else
      :some
    end
  end

  def email
    "submit+homework#{self.to_param}@homeworkio.com"
  end

  def self.from_address(address)
    id = /\w+\+homework(?<id>\d+)/.match(address).try(:[], :id)
    find_by_id id
  end

  def teacher
    list.user.email
  end

  def submissions_by_student
    submissions.group_by &:student
  end
end
