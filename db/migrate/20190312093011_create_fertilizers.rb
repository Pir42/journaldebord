class CreateFertilizers < ActiveRecord::Migration[5.2]
  def change
    create_table :fertilizers do |t|
      t.string :name
      t.integer :nitrogen
      t.integer :phosphorus
      t.integer :potassium
      t.string :supplier
      t.text :details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
