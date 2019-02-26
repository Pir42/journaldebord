class CreateVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :varieties do |t|
      t.string :name
      t.references :vegetable, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
