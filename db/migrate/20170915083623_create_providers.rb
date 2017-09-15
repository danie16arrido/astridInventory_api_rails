class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
