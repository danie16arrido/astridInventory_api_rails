class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :make
      t.string :model
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
