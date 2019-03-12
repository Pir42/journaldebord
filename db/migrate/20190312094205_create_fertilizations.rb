class CreateFertilizations < ActiveRecord::Migration[5.2]
  def change
    create_table :fertilizations do |t|
      t.date :date
      t.references :fertilizer, foreign_key: true
      t.float :quantity
      t.references :parcel, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
