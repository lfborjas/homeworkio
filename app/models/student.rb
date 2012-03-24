class Student < ActiveRecord::Base
  belongs_to :list
  belongs_to :student
  has_many :submissions
  #find or create a student within a homework's list
  def self.from_address(address, homework)
    homework.list.students.find_or_create_by_email(address)
  end

  #All unique submissions for the list
  def unique_submissions
    submissions.select('distinct(homework_id)')
  end
end
