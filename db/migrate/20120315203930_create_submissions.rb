class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :sender
      t.text :message
      t.string :attachment

      t.timestamps
    end
  end
end
