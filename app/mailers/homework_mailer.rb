class HomeworkMailer < ActionMailer::Base
  default from: "notifications@homework.io"

  def homework_notification(homework)
    @homework = homework
    mail to: homework.list.user.email,
         from: homework.email,
         bcc: homework.list.students.map(&:email),
         subject: homework.title
  end

  def submission_response(submission)
    @submission = submission
    mail to: submission.student.email,
         subject: "Your submission was accepted"
  end

  def submission_failure(submission)
    @submission = submission
    mail to: submission.student.email,
         from: submission.homework.email,
         subject: "Your submission was rejected"
  end
end
