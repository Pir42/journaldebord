class CreateDirectories < ActiveRecord::Migration[5.2]
  def change
    create_table :directories do |t|
      t.string :last_name
      t.string :first_name
      t.string :phone
      t.string :address
      t.string :postcode
      t.string :city
      t.string :contract
      t.text :comment

      t.timestamps
    end
  end
end
