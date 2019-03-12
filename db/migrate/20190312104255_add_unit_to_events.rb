class AddUnitToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :unit, :string
  end
end
