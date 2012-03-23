class AddDefaultFlagToLists < ActiveRecord::Migration
  def change
    add_column :lists, :is_default, :boolean, :null => false, :default => false
  end
end
