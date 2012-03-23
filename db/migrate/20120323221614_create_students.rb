class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email
      t.integer :list_id

      t.timestamps
    end
  end
end
