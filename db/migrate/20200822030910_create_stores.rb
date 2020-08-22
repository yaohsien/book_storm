class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.float :cash_balance
      t.string :name

      t.timestamps
    end
  end
end
