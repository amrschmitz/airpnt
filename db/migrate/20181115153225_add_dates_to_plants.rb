class AddDatesToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :date_beginning, :date
    add_column :plants, :date_end, :date
  end
end
