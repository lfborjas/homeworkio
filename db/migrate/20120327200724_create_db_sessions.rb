class CreateDbSessions < ActiveRecord::Migration
  def change
    create_table :db_sessions do |t|
      t.text :session
      t.references :user

      t.timestamps
    end
  end
end
