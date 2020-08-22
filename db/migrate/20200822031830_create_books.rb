class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.float :price
      t.string :name
      t.integer :store_id

      t.timestamps
    end
  end
end
