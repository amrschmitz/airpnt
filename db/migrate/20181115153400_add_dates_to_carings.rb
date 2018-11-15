class AddDatesToCarings < ActiveRecord::Migration[5.2]
  def change
    add_column :carings, :date_beginning, :date
    add_column :carings, :date_end, :date
  end
end
