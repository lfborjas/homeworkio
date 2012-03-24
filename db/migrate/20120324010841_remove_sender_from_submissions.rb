class RemoveSenderFromSubmissions < ActiveRecord::Migration
  def up
    remove_column :submissions, :sender
      end

  def down
    add_column :submissions, :sender, :string
  end
end
