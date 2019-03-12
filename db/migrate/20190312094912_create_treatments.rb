class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
      t.date :date
      t.references :variety, foreign_key: true
      t.text :details
      t.float :quantity
      t.string :unit
      t.references :parcel, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
