class HomeworkMailer < ActionMailer::Base
  default from: "notifications@homework.io"

  def homework_notification(homework)
    @homework = homework
    mail to: homework.list.user.email,
         from: homework.email,
         bcc: homework.list.students.map(&:email),
         subject: homework.title
  end
end
