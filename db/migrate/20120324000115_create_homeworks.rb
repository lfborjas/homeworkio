class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :list_id
      t.string :title
      t.text :message
      t.datetime :deadline

      t.timestamps
    end
  end
end
