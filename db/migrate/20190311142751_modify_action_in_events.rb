class ModifyActionInEvents < ActiveRecord::Migration[5.2]
  def change
  	remove_column :events, :action
    add_reference :events, :action_types, foreign_key: true
  end
end
