class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status
      t.datetime :expected
      t.datetime :date_in
      t.datetime :date_out
      t.integer :job
      t.references :device, foreign_key: true
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
