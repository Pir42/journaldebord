class ChangeActionTypeInEvents < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :events, :action_types
    add_reference :events, :action_type, foreign_key: true
  end
end
