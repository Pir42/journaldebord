class ModifyParcelInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :parcel
    add_reference :events, :parcel, foreign_key: true
  end
end
