class AddStudentHomeworkToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :student_id, :integer

    add_column :submissions, :homework_id, :integer

  end
end
