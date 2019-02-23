class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.string :variety
      t.string :parcel
      t.string :action
      t.text :details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
