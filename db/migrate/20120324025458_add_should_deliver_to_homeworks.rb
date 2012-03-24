class AddShouldDeliverToHomeworks < ActiveRecord::Migration
  def change
    add_column :homeworks, :should_deliver, :boolean

  end
end
