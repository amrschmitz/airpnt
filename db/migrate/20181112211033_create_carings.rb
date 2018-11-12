class CreateCarings < ActiveRecord::Migration[5.2]
  def change
    create_table :carings do |t|
      t.references :user, foreign_key: true
      t.references :plant, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
